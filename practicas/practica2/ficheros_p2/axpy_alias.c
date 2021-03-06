/*
 * Este código es una adaptación del benchmark desarrollado por
 *  - Saeed Maleki   (maleki1@illinois.edu)  - University of Illinois at Urbana-Champaing
 *  - David Padua    (padua@illinois.edu)    - University of Illinois at Urbana-Champaing
 *  - Maria Garzaran (garzaran@illinois.edu) - University of Illinois at Urbana-Champaing 
 * y que está disponible en la siguiente URL:
 * http://polaris.cs.uiuc.edu/~garzaran/pldi-polv.zip
 * 
 * Benchmark que a su vez es una versión traducida del
 * TEST SUITE FOR VECTORIZING COMPILERS from Fortran to C.
 * The collection was written by:
 *  - David Callahan
 *  - Jack Dongarra
 *  - David Levine
 * The original benchmark can be downloaded from:
 *                    http://www.netlib.org/benchmark/vectors
 *
 *
 * To compile the collection, the dummy.c file needs to be compiled separately
 * and the object file is linked to this file to compile it
 *
 *  The output includes five columns:
 *	Loop:		The name of the loop
 *	Time(Sec): 	The time in seconds to run the loop
 *	ps/it: 	    picoseconds per loop iteration
 *	FLOPs per cycle: Number of flops per cycle
 *	Checksum:	The checksum calculated when the test has run
 *
 *
 * 2014-05: adapted by
 *  - Jesus Alastruey-Benede (jalastru@unizar.es) - Universidad de Zaragoza
 * 2016-02 changes: float -> real
 * 2016-11 changes: added one metric: time per C iteration (ns/it)
 * 2017-02 changes:
 *   - wall time
 *   - added one metric: FLOPs per cycle
 *   - no inlining and no vectorization of auxiliary functions to improve clarity
 */

#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <malloc.h>
//#include <sys/param.h>
//#include <sys/times.h>
//#include <sys/types.h>
#include <time.h>
#include <sys/time.h>
#include <sys/times.h>
#include <sys/types.h>
#include <malloc.h>
#include <string.h>
#include <assert.h>
#include <x86intrin.h>      /* chus */
//http://stackoverflow.com/questions/11228855/header-files-for-simd-intrinsics
//#include <builtins.h>
#include "precision.h"

#define uint unsigned int

#ifndef LEN 
    #define LEN     2048
#endif
#define FLOP_COUNT  (unsigned long int) 20e9     /* operaciones a realizar: 20 GFLOPs */
#define FLOPs_IT    (unsigned long int)    2     /* 2 FLOPs cada iteración */
#define NTIMES      (FLOP_COUNT/(LEN*FLOPs_IT))  /* repeticiones bucle externo para completar FLOP_COUNT */
#define SIMD_ALIGN  64

/* LEN+1 porque hay recorridos que se inician en el elemento 1 */
real x[LEN+1] __attribute__((aligned(SIMD_ALIGN)));
real y[LEN+1] __attribute__((aligned(SIMD_ALIGN)));
real z[LEN+1] __attribute__((aligned(SIMD_ALIGN)));
real alpha = 0.1;

int dummy(real x[], real y[], real z[], real alpha);

/* inhibimos el inlining de algunas funciones
 * para que el ensamblador sea más cómodo de leer */

/* return wall time in seconds */
__attribute__ ((noinline))
double
get_wall_time()
{
    struct timeval time;
    if (gettimeofday(&time,NULL)) {
        exit(-1); // return 0;
    }
    return (double)time.tv_sec + (double)time.tv_usec * .000001;
}

/* return cpu time in seconds */
__attribute__ ((noinline))
double
 get_cpu_time()
{
    return (double) clock() / CLOCKS_PER_SEC;
}

/* returns cpu frequency in GHz */
#define BUFLEN 256
double getCPUfreq()
{
   FILE * sysinfo;
   char * ptr;
   char buf[BUFLEN], key[] = "model name";
   int keylen = sizeof(key) - 1;
    double freq = 0;

   sysinfo = fopen( "/proc/cpuinfo", "r" );
    if (sysinfo != NULL)
    {
        while (fgets(buf, BUFLEN, sysinfo) != NULL)
        {
            if (!strncmp(buf, key, keylen))
            {
            ptr = strstr(buf, "@" );
                // fprintf(stderr, "CPU freq: %s", ptr+1);
                sscanf(ptr+1, "%lf", &freq);
                // fprintf(stderr, "%lf\n", freq);
            break;
         }
      }
      fclose(sysinfo);
   }
   return(freq);
}


/* inhibimos vectorización en esta función
 * para que los informes de compilación sean más cómodos de leer */
__attribute__((optimize("no-tree-vectorize")))
__attribute__ ((noinline))
int 
set1d(real arr[LEN], real value, int stride)
{
  if (stride == -1) {
    for (unsigned int i = 0; i < LEN; i++)
      arr[i] = 1. / (real) (i+1);
  }
  else if (stride == -2) {
    /* if (i > 65535) -> overflow of (i+1)*(i+1) */
    for (unsigned int i = 0; i < LEN; i++)
      arr[i] = 1. / (real) ((i+1) * (i+1));
  }
  else {
    for (unsigned int i = 0; i < LEN; i += stride)
      arr[i] = value;
  }
  return 0;
}

/* inhibimos vectorización en esta función
 * para que los informes de compilación sean más cómodos de leer */
__attribute__((optimize("no-tree-vectorize")))
void check(real arr[LEN])
{
  real sum = 0;

  for (int i = 0; i < LEN; i++)
    sum += arr[i];

  printf("%f \n", sum);
}

__attribute__ ((noinline))
int init(real *vx, real *vy, real *vz)
{
  real any = 0., one = 1.;
  int unit = 1, frac1 = -1;

  set1d(vx, one, unit);
  set1d(vy, any, frac1);
  set1d(vz, any, frac1);

  return 0;
}

__attribute__ ((noinline))
void results(double wall_time, unsigned int vlen, char *loop)
{
  printf("%14s  %5.2f \t %4.1f \t",
          loop /* nombre del bucle */,
          wall_time,
          (FLOPs_IT*NTIMES*vlen)/(wall_time*(1e9)*getCPUfreq()) /* FLOPs por ciclo */);
}

int axpy_alias_v1(real *vx, real *vy, real *vz)
{
  double start_t, end_t, wall_dif;

  init(vx, vy, vz);
  start_t = get_wall_time();

  for (uint nl = 0; nl < NTIMES; nl++) {
    for (int i = 0; i < LEN; i++) {
      vz[i] = alpha*vx[i] + vy[i];
    }
    dummy(vx, vy, vz, alpha);
  }
  end_t = get_wall_time(); wall_dif = end_t - start_t;
  results(wall_dif, LEN, "axpy_alias_v1");
  check(vz);
  return 0;
}

int axpy_alias_v2(real * restrict vx, real * restrict vy, real * restrict vz)
{
  double start_t, end_t, wall_dif;

  init(vx, vy, vz);
  start_t = get_wall_time();

  for (uint nl = 0; nl < NTIMES; nl++) {
    for (int i = 0; i < LEN; i++) {
      vz[i] = alpha*vx[i] + vy[i];
    }
    dummy(vx, vy, vz, alpha);
  }
  end_t = get_wall_time(); wall_dif = end_t - start_t;
  results(wall_dif, LEN, "axpy_alias_v2");
  check(vz);
  return 0;
}

int axpy_alias_v3(real *vx, real *vy, real *vz)
{
  double start_t, end_t, wall_dif;

  init(vx, vy, vz);
  start_t = get_wall_time();

  for (uint nl = 0; nl < NTIMES; nl++) {
    #pragma GCC ivdep
    for (int i = 0; i < LEN; i++) {
      vz[i] = alpha*vx[i] + vy[i];
    }
    dummy(vx, vy, vz, alpha);
  }
  end_t = get_wall_time(); wall_dif = end_t - start_t;
  results(wall_dif, LEN, "axpy_alias_v3");
  check(vz);
  return 0;
}

int axpy_alias_v4(real * restrict vx, real * restrict vy, real * restrict vz)
{
  real *xx = __builtin_assume_aligned(vx, SIMD_ALIGN);
  real *yy = __builtin_assume_aligned(vy, SIMD_ALIGN);
  real *zz = __builtin_assume_aligned(vz, SIMD_ALIGN);
  double start_t, end_t, wall_dif;

  init(xx, yy, zz);
  start_t = get_wall_time();

  for (uint nl = 0; nl < NTIMES; nl++) {
    for (int i = 0; i < LEN; i++) {
      zz[i] = alpha*xx[i] + yy[i];
    }
    dummy(xx, yy, zz, alpha);
  }
  end_t = get_wall_time(); wall_dif = end_t - start_t;
  results(wall_dif, LEN, "axpy_alias_v4");
  check(zz);
  return 0;
}

/* variables globales */
int axpy()
{
  double start_t, end_t, wall_dif;

  init(x, y, z);
  start_t = get_wall_time();

  for (uint nl = 0; nl < NTIMES; nl++) {
    for (int i = 0; i < LEN; i++) {
      y[i] = alpha*x[i] + y[i];
    }
    dummy(x, y, z, alpha);
  }
  end_t = get_wall_time(); wall_dif = end_t - start_t;
  results(wall_dif, LEN, "axpy");
  check(y);
  return 0;
}

int main()
{
  posix_memalign((void **) &x, SIMD_ALIGN, LEN*sizeof(real));
  posix_memalign((void **) &y, SIMD_ALIGN, LEN*sizeof(real));
  posix_memalign((void **) &z, SIMD_ALIGN, LEN*sizeof(real));
  //x = aligned_alloc(SIMD_ALIGN, LEN*sizeof(real));
  //y = aligned_alloc(SIMD_ALIGN, LEN*sizeof(real));
  //z = aligned_alloc(SIMD_ALIGN, LEN*sizeof(real));
    
  /* z[] = alpha*x[] + y[] */

  printf("                 Time \tFLOPs/ \t          \n");
  printf("          Loop    (s) \tcycle  \t  Checksum \n");

  axpy_alias_v1(x, y, &y[1]);      /* solapamiento y dependencia */
  axpy_alias_v1(&x[1], &y[1], y);  /* solapamiento, no dependencia */
  axpy_alias_v1(x, y, y);          /* solapamiento, no dependencia */
  axpy_alias_v1(x, y, z);          /* no solapamiento, no dependencia */

  /* restrict en parametros */
  axpy_alias_v2(&x[1], &y[1], &z[1]);  /* no solapamiento, no dependencia */
  axpy_alias_v2(x, y, z);              /* no solapamiento, no dependencia */

  /* #pragma GCC ivdep */
  axpy_alias_v3(&x[1], &y[1], &z[1]);  /* no solapamiento, no dependencia */
  axpy_alias_v3(x, y, z);              /* no solapamiento, no dependencia */

  /* restrict en parametros + __builtin_assume_aligned() */
  axpy_alias_v4(x, y, z);             /* no solapamiento, no dependencia */

  /* axpy p1 */
  axpy();                             /* solapamiento, no dependencia */

  return 0;
}


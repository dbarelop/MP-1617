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
 *  Loop:       The name of the loop
 *  Time(Sec):  The time in seconds to run the loop
 *  ps/it:      picoseconds per loop iteration
 *  FLOPs per cycle: Number of flops per cycle
 *  Checksum:   The checksum calculated when the test has run
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
#include <sys/param.h>
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

#ifndef LEN 
    #define LEN     2000
#endif
#define FLOP_COUNT  (unsigned long int) 20e9     /* operaciones a realizar: 20 GFLOPs */
#define FLOPs_IT    (unsigned long int)    2     /* 2 FLOPs cada iteración */
#define NTIMES      (FLOP_COUNT/(LEN*FLOPs_IT))  /* repeticiones bucle externo para completar FLOP_COUNT */
#define SIMD_ALIGN  64

real x[LEN] __attribute__((aligned(SIMD_ALIGN)));
real y[LEN] __attribute__((aligned(SIMD_ALIGN)));
real z[LEN] __attribute__((aligned(SIMD_ALIGN)));
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
   double freq;

   sysinfo = fopen( "/proc/cpuinfo", "r" );
   if (sysinfo != NULL) {
      while (fgets(buf, BUFLEN, sysinfo) != NULL) {
         if (!strncmp(buf, key, keylen)) {
            ptr = strstr(buf, "@" );
            break;
         }
      }
      fclose(sysinfo);
   }
   // fprintf(stderr, "CPU freq: %s", ptr+1);
   sscanf(ptr+1, "%lf", &freq);
   // fprintf(stderr, "%lf\n", freq);
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
int init()
{
  real any = 0., one = 1.;
  int unit = 1, frac1 = -1;

  set1d(x, one, unit);
  set1d(y, any, frac1);
  set1d(z, any, frac1);

  return 0;
}

__attribute__ ((noinline))
void results(double wall_time, char *loop)
{
  printf("%14s  %5.2f \t %5.1f \t %4.1f \t",
          loop /* nombre del bucle */,
          wall_time,
          wall_time/(1e-12*NTIMES*LEN) /* ps por iteración */,
          (FLOPs_IT*NTIMES*LEN)/(wall_time*(1e9)*getCPUfreq()) /* FLOPs por ciclo */);
}

/* funciones de cálculo */
int axpy()
{
  double start_t, end_t, wall_dif;

  init();
  start_t = get_wall_time();

  for (int nl = 0; nl < NTIMES; nl++) {
    for (int i = 0; i < LEN; i++) {
      y[i] = alpha*x[i] + y[i];
    }
    dummy(x, y, z, alpha);
  }
  end_t = get_wall_time(); wall_dif = end_t - start_t;
  results(wall_dif, "axpy");
  check(y);
  return 0;
}

int axpy_intr_SSE()
{
  double start_t, end_t, wall_dif;

  init();
  start_t = get_wall_time();

#if PRECISION==0
  __m128 vX,vY;
  __m128 valpha, vaX;
  for (int nl = 0; nl < NTIMES; nl++) {
    valpha = _mm_set1_ps(alpha);      //valpha = _mm_load1_ps(&alpha);
    for (int i = 0; i < LEN; i+= SSE_LEN) {
      vX = _mm_load_ps(&x[i]);
      vY = _mm_load_ps(&y[i]);
      vaX = _mm_mul_ps(valpha, vX);
      vY = _mm_add_ps(vaX, vY);
      _mm_store_ps(&y[i], vY);
    }
    dummy(x, y, z, alpha);
  }

#else
  __m128d vX,vY;
  __m128 valpha, vaX;
  for (int nl = 0; nl < NTIMES; nl++) {
    valpha = _mm_set1_pd(alpha);
    //valpha = _mm_load1_pd(&alpha);
    for (int i = 0; i < LEN; i+= SSE_LEN) {
      vX = _mm_load_pd(&x[i]);
      vY = _mm_load_pd(&y[i]);
      vaX = _mm_mul_pd(valpha, vX);
      vY = _mm_add_pd(vaX, vY);
      _mm_store_pd(&y[i], vY);
    }
    dummy(x, y, z, alpha);
  }
#endif

  end_t = get_wall_time(); wall_dif = end_t - start_t;
  results(wall_dif, "axpy_intr_SSE");
  check(y);
  return 0;
}

int axpy_intr_AVX()
{
  double start_t, end_t, wall_dif;

  init();
  start_t = get_wall_time();

#if PRECISION==0
  __m256 vX, vY;
  __m256 valpha, vaX;
  for (int nl = 0; nl < NTIMES; nl++) {
    valpha = _mm256_set1_ps(alpha);
    for (int i = 0; i < LEN; i += AVX_LEN) {
        vX = _mm256_load_ps(&x[i]);
        vY = _mm256_load_ps(&y[i]);
        vaX = _mm256_mul_ps(valpha, vX);
        vY = _mm256_add_ps(vaX, vY);
        _mm256_store_ps(&y[i], vY);
    }
    dummy(x, y, z, alpha);
  }
#else
  __m256d vX, vY;
  __m256 valpha, vaX;
  for (int nl = 0; nl < NTIMES; nl++) {
    valpha = _mm256_set1_pd(alpha);
    for (int i = 0; i < LEN; i += AVX_LEN) {
      vX = _mm256_load_pd(&x[i]);
      vY = _mm256_load_pd(&y[i]);
      vaX = _mm256_mul_pd(valpha, vX);
      vY = _mm256_add_pd(vaX, vY);
      _mm256_store_pd(&y[i], vY);
    }
    dummy(x, y, z, alpha);
  }
#endif

  end_t = get_wall_time(); wall_dif = end_t - start_t;
  results(wall_dif, "axpy_intr_AVX");
  check(y);
  return 0;
}

#if 0
int axpy_intr_AVX_FMA()
{
  double start_t, end_t, wall_dif;

  init();
  start_t = get_wall_time();

#if PRECISION==0

#else

#endif

  end_t = get_wall_time(); wall_dif = end_t - start_t;
  results(wall_dif, "axpy_intr_AVX+FMA");
  check(y);
  return 0;
}
#endif

int main()
{
  // printf("LEN: %u,  NTIMES: %u\n\n", LEN, NTIMES);
  printf("                 Time \t  TPI  \tFLOPs/ \t          \n");
  printf("          Loop    (s) \t ps/it \tcycle  \t  Checksum \n");
  axpy();
  axpy_intr_SSE();
  axpy_intr_AVX();
  //axpy_intr_AVX_FMA();
  return 0;
}

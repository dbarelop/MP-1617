/* Adaptado: Jesús Alastruey Benedé
 * v1.0, 28-abril-2016
 * v1.1, 24-marzo-2017 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <sys/times.h>
#include <malloc.h>
#include "jpeg_handler.h"
#include "include/jpeglib.h"
#include "misc.h"

//----------------------------------------------------------------------------

int dummy(image_t *im1, image_t *im2);

//----------------------------------------------------------------------------

/* inhibimos el inlining
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
//----------------------------------------------------------------------------

/* return cpu time in seconds */
__attribute__ ((noinline))
double
get_cpu_time()
{
    return (double) clock() / CLOCKS_PER_SEC;
}
//----------------------------------------------------------------------------

/* inhibimos el inlining de algunas funciones
 * para que el ensamblador sea más cómodo de leer */
__attribute__ ((noinline))
void results(double wall_time, int height, int width, char *loop)
{
  // printf("                  Time\n");
  // printf("función            (s)\tns/pix\tGpixels/s\n");

  printf("%15s  %5.2f \t %4.1f \t   %4.2f \n",
          loop /* nombre del bucle */,
          wall_time,
          (1e9)*wall_time/(NITER*height*width)  /* ns/pixel */,
          (NITER*height*width)/(wall_time*(1e9)) /* Gpixels por segundo */);
}
//----------------------------------------------------------------------------

int
cmpColor(image_t * image_in1, image_t * image_in2, image_t * image_out)
{
    double start_t, end_t, wall_dif;
    const int height = image_in1->height;
    const int width =  image_in1->width;
    const int color_space =  image_in1->color_space;
    unsigned char * pixels_in1 = image_in1->pixels;
    unsigned char * pixels_in2 = image_in2->pixels;
    unsigned char * pixels_out = image_out->pixels;
    int max_idx, diff;
    char max_diff; /* can be negative */

    if (image_in1->bytes_per_pixel != 3)
    {
        printf("ERROR: input image has to be RGB or YCbCr\n");
        exit(-1);
    }
    
    /* fill struct fields */
    image_out->width  = width;
    image_out->height = height;
    image_out->bytes_per_pixel = 3;
    image_out->color_space = color_space;

    start_t = get_wall_time();

    for (int it=0; it<NITER/10; it++)
    {
        max_diff = 0; max_idx = -1; diff = 0;

        for (int i=0; i<3*height*width; i++)
        {
            pixels_out[i] = abs(pixels_in1[i] - pixels_in2[i]);
            if (pixels_out[i] != 0)
            {
                diff++;
                if (pixels_out[i] > max_diff)
                {
                    max_diff = pixels_out[i];
                    max_idx = i;
                }
            }
        }
        dummy(image_in1, image_out);
    }
    end_t = get_wall_time(); wall_dif = end_t - start_t;
    printf("%15s  %5.2f \t %4.1f \t   %4.2f \t %.1f%%  %hhd (%d)\n",
           "cmpColor()",
           wall_dif, wall_dif*1e9/(NITER/10*height*width),
           (NITER*height*width)/(1e9*wall_dif), (double) 100.0*diff/(3*height*width), max_diff, max_idx);

    return(max_diff);
}
//----------------------------------------------------------------------------

int
cmpGray(image_t * image_in1, image_t * image_in2, image_t * image_out)
{
    double start_t, end_t, wall_dif;
    const int height = image_in1->height;
    const int width =  image_in1->width;
    unsigned char * pixels_in1 = image_in1->pixels;
    unsigned char * pixels_in2 = image_in2->pixels;
    unsigned char * pixels_out = image_out->pixels;
    int max_idx, diff;
    char max_gray_diff; /* can be negative */

    if (image_in1->bytes_per_pixel != 1)
    {
        printf("ERROR: input image has to be GRAY\n");
        exit(-1);
    }
    
    /* fill struct fields */
    image_out->width  = width;
    image_out->height = height;
    image_out->bytes_per_pixel = 1;
    image_out->color_space = JCS_GRAYSCALE;

    start_t = get_wall_time();

    for (int it=0; it<NITER/10; it++)
    {
        max_gray_diff = 0; max_idx = -1; diff = 0;

        for (int i=0; i<height*width; i++)
        {
            pixels_out[i] = abs(pixels_in1[i] - pixels_in2[i]);
            if (pixels_out[i] != 0)
            {
                diff++;
                if (pixels_out[i] > max_gray_diff)
                {
                    max_gray_diff = pixels_out[i];
                    max_idx = i;
                }
            }
        }
        dummy(image_in1, image_out);
    }
    end_t = get_wall_time(); wall_dif = end_t - start_t;
    printf("cmpGray()     \t  %.2f  \t  %.2f  \t   %.2f   \t %.1f%%  %hhd (%d)\n",
           wall_dif, 1e9*wall_dif/(NITER/10*height*width),
           (NITER*height*width)/(1e9*wall_dif), (double) 100.0*diff/(height*width), max_gray_diff, max_idx);

    return(max_gray_diff);
}
//----------------------------------------------------------------------------

int
write_PGM(char *filename, image_t * image_in)
{
    double start_t, end_t, wall_dif;
    const int height = image_in->height;
    const int width =  image_in->width;
    unsigned char * pixels_in  = image_in->pixels;

    if (image_in->bytes_per_pixel != 1)
    {
        printf("ERROR: input image has to be gray\n");
        exit(-1);
    }

    start_t = get_wall_time();

    FILE *outfile = fopen(filename, "w");
    if (!outfile)
    {
        printf("ERROR: no se ha indicado fichero de salida\n");
        return -1;
    }

    /* PGM header */
    fprintf(outfile, "P2 %u %u 255\n", width, height);

    for (int i=0; i<height*width; i++)
    {
        fprintf(outfile, "%u\n", pixels_in[i]);
    }

    fclose(outfile);

    end_t = get_wall_time(); wall_dif = end_t - start_t;
    printf("dumpGray()\t  %.2f  \t  %.2f  \t   %.2f\n",
           wall_dif, 1e9*wall_dif/(NITER*height*width),
           (NITER*height*width)/(1e9*wall_dif));

    return 0;
}
//----------------------------------------------------------------------------

int
write_PPM(char *filename, image_t * image_in)
{
    double start_t, end_t, wall_dif;
    const int height = image_in->height;
    const int width =  image_in->width;
    unsigned char * pixels_in  = image_in->pixels;

    if (image_in->bytes_per_pixel != 3)
    {
        printf("ERROR: input image has to be RGB or YCbCr\n");
        exit(-1);
    }

    start_t = get_wall_time();

    FILE *outfile = fopen(filename, "w");
    if (!outfile)
    {
        printf("ERROR: no se ha indicado fichero de salida\n");
        return -1;
    }

    /* PPM header */
    fprintf(outfile, "P3 %u %u 255\n", width, height);

    for (int i=0; i<height*width; i++)
    {
        fprintf(outfile, "%u %u %u\n",
                pixels_in[3*i+0],
                pixels_in[3*i+1],
                pixels_in[3*i+2]);
    }

    fclose(outfile);

    end_t = get_wall_time(); wall_dif = end_t - start_t;
    results(wall_dif, height, width, "dumpColor()");
    return 0;
}
//----------------------------------------------------------------------------

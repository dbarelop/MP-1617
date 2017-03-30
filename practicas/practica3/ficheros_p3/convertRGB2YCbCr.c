/* Conversión de imagen RGB a YCbCr
 * (implementaciones varias para evaluar su rendimiento) */

/* https://en.wikipedia.org/wiki/YCbCr#JPEG_conversion
 */

/* Jesús Alastruey Benedé
 * v1.0, 24-marzo-2017
 */

#define _POSIX_C_SOURCE 200112L     /* para evitar el aviso al compilar
                                       con la función posix_memalign() */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <sys/times.h>
#include <malloc.h>
#include <math.h>
#include "jpeg_handler.h"
#include "include/jpeglib.h"
#include "convertRGB2YCbCr.h"
#include "misc.h"


int dummy(image_t *im1, image_t *im2);
//----------------------------------------------------------------------------

/* factores y desplazamientos para conversión RGB -> YCbCr */
static const float
RGB2YCbCr[3][3] = {
   { 0.299,     0.587,     0.114    },
   {-0.168736, -0.331264,  0.500    },
   { 0.500,    -0.418688, -0.081312 }
};
static const float
RGB2YCbCr_offset[3] = { 0.0,  128.0,  128.0 };

//----------------------------------------------------------------------------

void
convertRGB2YCbCr_v1(image_t * image_in, image_t * image_out)
{
    double start_t, end_t, wall_dif;
    const int height = image_in->height;
    const int width =  image_in->width;

    if (image_in->bytes_per_pixel != 3)
    {
        printf("ERROR: input image has to be RGB\n");
        exit(-1);
    }
    
    /* fill struct fields */
    image_out->width  = width;
    image_out->height = height;
    image_out->bytes_per_pixel = 3;
    image_out->color_space = JCS_YCbCr;

    start_t = get_wall_time();

    for (int it=0; it<NITER; it++)
    {
        for (int i=0; i<height*width; i++)
        {
            /* R */
            image_out->pixels[3*i + 0] = (unsigned char)
               (RGB2YCbCr_offset[0] +
                RGB2YCbCr[0][0]*image_in->pixels[3*i + 0] + 
                RGB2YCbCr[0][1]*image_in->pixels[3*i + 1] + 
                RGB2YCbCr[0][2]*image_in->pixels[3*i + 2]);
            /* G */
            image_out->pixels[3*i + 1] = (unsigned char)
               (RGB2YCbCr_offset[1] +
                RGB2YCbCr[1][0]*image_in->pixels[3*i + 0] + 
                RGB2YCbCr[1][1]*image_in->pixels[3*i + 1] + 
                RGB2YCbCr[1][2]*image_in->pixels[3*i + 2]);
            /* B */
            image_out->pixels[3*i + 2] = (unsigned char)
               (RGB2YCbCr_offset[2] +
                RGB2YCbCr[2][0]*image_in->pixels[3*i + 0] + 
                RGB2YCbCr[2][1]*image_in->pixels[3*i + 1] + 
                RGB2YCbCr[2][2]*image_in->pixels[3*i + 2]);
        }
        dummy(image_in, image_out);
    }

    end_t = get_wall_time(); wall_dif = end_t - start_t;
    results(wall_dif, height, width, "RGB2YCbCr_v1()");
}
//----------------------------------------------------------------------------


void
convertRGB2YCbCr_v2(image_t * restrict image_in, image_t * restrict image_out)
{
    double start_t, end_t, wall_dif;
    const int height = image_in->height;
    const int width =  image_in->width;
    float *tmpR = (float *) malloc(sizeof(float) * height * width);
    float *tmpG = (float *) malloc(sizeof(float) * height * width);
    float *tmpB = (float *) malloc(sizeof(float) * height * width);
    float *constantsR = (float *) malloc(sizeof(float) * 3 * height * width);
    float *constantsG = (float *) malloc(sizeof(float) * 3 * height * width);
    float *constantsB = (float *) malloc(sizeof(float) * 3 * height * width);

    if (image_in->bytes_per_pixel != 3)
    {
        printf("ERROR: input image has to be RGB\n");
        exit(-1);
    }
    
    /* fill struct fields */
    image_out->width  = width;
    image_out->height = height;
    image_out->bytes_per_pixel = 3;
    image_out->color_space = JCS_YCbCr;

    start_t = get_wall_time();

    for (int it=0; it<NITER; it++)
    {
        /* R */
        for (int i=0; i<height*width; i++)  // VECTORIZADO
        {
            tmpR[i] = RGB2YCbCr_offset[0] + 
                      RGB2YCbCr[0][0]*image_in->pixels[3*i + 0] + 
                      RGB2YCbCr[0][1]*image_in->pixels[3*i + 1] + 
                      RGB2YCbCr[0][2]*image_in->pixels[3*i + 2];
        }
        /* G */
        for (int i=0; i<height*width; i++)  // VECTORIZADO
        {
            tmpG[i] = RGB2YCbCr_offset[1] + 
                      RGB2YCbCr[1][0]*image_in->pixels[3*i + 0] + 
                      RGB2YCbCr[1][1]*image_in->pixels[3*i + 1] + 
                      RGB2YCbCr[1][2]*image_in->pixels[3*i + 2];
        }
        /* B */
        for (int i=0; i<height*width; i++)  // VECTORIZADO
        {
            tmpB[i] = RGB2YCbCr_offset[2] + 
                      RGB2YCbCr[2][0]*image_in->pixels[3*i + 0] + 
                      RGB2YCbCr[2][1]*image_in->pixels[3*i + 1] + 
                      RGB2YCbCr[2][2]*image_in->pixels[3*i + 2];
        }
        /* Combinar resultados en los píxeles de image_out */
        for (int i=0; i<height*width; i++)  // VECTORIZED
        {
            image_out->pixels[3*i + 0] = (unsigned char) tmpR[i];
            image_out->pixels[3*i + 1] = (unsigned char) tmpG[i];
            image_out->pixels[3*i + 2] = (unsigned char) tmpB[i];
        }
        dummy(image_in, image_out);
    }
    free(tmpR);
    free(tmpG);
    free(tmpB);

    end_t = get_wall_time(); wall_dif = end_t - start_t;
    results(wall_dif, height, width, "RGB2YCbCr_v2()");
}
//----------------------------------------------------------------------------

/* transformación de datos de entrada y salida de formato vector de estructuras (Array of Structs, AoS)
 * (R0 G0 B0 R1 G1 B1 ... Rn-1 Gn-1 Bn-1)
 * a estructura de vectores (Struct of Arrays, SoA)
 * (R0 R1 ... Rn-1 G0 G1 ... Gn-1 B0 B1 ... Bn-1) */
void
convertRGB2YCbCr_SOA1(image_t * restrict image_in, image_t * restrict image_out)
{
    double start_t, end_t, wall_dif;
    const int height = image_in->height;
    const int width =  image_in->width;
    unsigned char *Rpixels, *Gpixels, *Bpixels, *Ypixels, *Cbpixels, *Crpixels;

    if (image_in->bytes_per_pixel != 3)
    {
        printf("ERROR: input image has to be RGB\n");
        exit(-1);
    }
    
    /* fill struct fields */
    image_out->width  = width;
    image_out->height = height;
    image_out->bytes_per_pixel = 3;
    image_out->color_space = JCS_YCbCr;

    Rpixels = (unsigned char*) malloc(width*height);
    Gpixels = (unsigned char*) malloc(width*height);
    Bpixels = (unsigned char*) malloc(width*height);

    Ypixels = (unsigned char*) malloc(width*height);
    Cbpixels = (unsigned char*) malloc(width*height);
    Crpixels = (unsigned char*) malloc(width*height);

    /* transformación AoS -> SoA */
    for (int i=0; i<height*width; i++)
    {
        Rpixels[i] = image_in->pixels[3*i + 0];
        Gpixels[i] = image_in->pixels[3*i + 1];
        Bpixels[i] = image_in->pixels[3*i + 2];
    }

    start_t = get_wall_time();

    for (int it=0; it<NITER; it++)
    {
        /* COMPLETAR ... */
        for (int i=0; i<height*width; i++)
        {
            /* R */
            // Ypixels[i] = f(Rpixels[i], Gpixels[i], Bpixels[i]);
            /* G */
            /* B */
        }
        dummy(image_in, image_out);
    }

    end_t = get_wall_time(); wall_dif = end_t - start_t;
    results(wall_dif, height, width, "RGB2YCbCrSOA1()");

    /* transformación SoA -> AoS */
    /* COMPLETAR ... */
    for (int i=0; i<height*width; i++)
    {
        // = Ypixels[i];
        // = Cbpixels[i];
        // = Crpixels[i];
    }
}
//----------------------------------------------------------------------------

#define BLOCK 64

 /* función que entrelaza la transformación de los datos con los cálculos a realizar.
    De esta forma, en lugar de necesitar nuevas variables
    con **todos** los valores RGB de la imagen en formato SOA,
    solamente son necesarias variables que almacenen **parte** de los valores RGB */
void
convertRGB2YCbCr_block(image_t * image_in, image_t * image_out)
{
    double start_t, end_t, wall_dif;
    const int height = image_in->height;
    const int width =  image_in->width;
    unsigned char Rpixels[BLOCK];
    unsigned char Gpixels[BLOCK];
    unsigned char Bpixels[BLOCK];
    unsigned char Ypixels[BLOCK];
    unsigned char Cbpixels[BLOCK];
    unsigned char Crpixels[BLOCK];

    if (image_in->bytes_per_pixel != 3)
    {
        printf("ERROR: input image has to be RGB\n");
        exit(-1);
    }
    
    /* fill struct fields */
    image_out->width  = width;
    image_out->height = height;
    image_out->bytes_per_pixel = 3;
    image_out->color_space = JCS_YCbCr;

    start_t = get_wall_time();

    for (int it=0; it<NITER; it++)
    {
        /* COMPLETAR, MODIFICAR ... */
        for (int i=0; i<height*width; i++ /* esto hay que cambiarlo */)
        {
            /* transformación AoS -> SoA */
            for (int j=0; j<BLOCK; j++)
            {
                // Rpixels[j] = ...;
                // Gpixels[j] = ...;
                // Bpixels[j] = ...;
            }
            /* conversión RGB -> YbCrCb */
            for (int j=0; j<BLOCK; j++)
            {
                // Ypixels[j]  = f(Rpixels[j], Gpixels[j], Bpixels[j]);
                // Cbpixels[j] = f(Rpixels[j], Gpixels[j], Bpixels[j]);
                // Crpixels[j] = f(Rpixels[j], Gpixels[j], Bpixels[j]);
            }
            /* transformación SoA -> AoS */
            for (int j=0; j<BLOCK; j++)
            {
                // ... = Ypixels[j];
                // ... = Cbpixels[j];
                // ... = Crpixels[j];
            }
        }
        dummy(image_in, image_out);
    }

    end_t = get_wall_time(); wall_dif = end_t - start_t;
    results(wall_dif, height, width, "RGB2YCbCr_blk()");
}
//----------------------------------------------------------------------------

static const float
YCbCr2RGB[3][3] = {
   { 1.0,  0.0,      1.402   },
   { 1.0, -0.34414, -0.71414 },
   { 1.0,  1.772,    0.0     }
};

static const int
YCbCr2RGB_offset[3][3]  = {
   { 0,    0,  128 },
   { 0,  128,  128 },
   { 0,  128,    0 }
};

//----------------------------------------------------------------------------

void
convertYCbCr2RGB(image_t * image_in, image_t * image_out)
{
    double start_t, end_t, wall_dif;
    const int height = image_in->height;
    const int width =  image_in->width;

    if (image_in->bytes_per_pixel != 3)
    {
        printf("ERROR: input image has to be YCbCr\n");
        exit(-1);
    }
    
    /* fill struct fields */
    image_out->width  = width;
    image_out->height = height;
    image_out->bytes_per_pixel = 3;
    image_out->color_space = JCS_RGB;

    start_t = get_wall_time();

    for (int it=0; it<NITER; it++)
    {
        #pragma GCC ivdep
        for (int i=0; i<height*width; i++)
        {
            image_out->pixels[3*i + 0] = (unsigned char)
               (YCbCr2RGB[0][0]*(image_in->pixels[3*i + 0] - YCbCr2RGB_offset[0][0]) + 
                YCbCr2RGB[0][1]*(image_in->pixels[3*i + 1] - YCbCr2RGB_offset[0][1]) + 
                YCbCr2RGB[0][2]*(image_in->pixels[3*i + 2] - YCbCr2RGB_offset[0][2]));
            image_out->pixels[3*i + 1] = (unsigned char)
               (YCbCr2RGB[1][0]*(image_in->pixels[3*i + 0] - YCbCr2RGB_offset[1][0]) + 
                YCbCr2RGB[1][1]*(image_in->pixels[3*i + 1] - YCbCr2RGB_offset[1][1]) + 
                YCbCr2RGB[1][2]*(image_in->pixels[3*i + 2] - YCbCr2RGB_offset[1][2]));
            image_out->pixels[3*i + 2] = (unsigned char)
               (YCbCr2RGB[2][0]*(image_in->pixels[3*i + 0] - YCbCr2RGB_offset[2][0]) + 
                YCbCr2RGB[2][1]*(image_in->pixels[3*i + 1] - YCbCr2RGB_offset[2][1]) + 
                YCbCr2RGB[2][2]*(image_in->pixels[3*i + 2] - YCbCr2RGB_offset[2][2]));
        }
        dummy(image_in, image_out);
    }

    end_t = get_wall_time(); wall_dif = end_t - start_t;
    results(wall_dif, height, width, "YCbCr2RGB()");
}
//----------------------------------------------------------------------------

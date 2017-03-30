/* Jesús Alastruey Benedé
 * v1.0, 6-marzo-2017
 */

#ifndef CONVERTRGB2YCBCR_GUARD

#include "jpeg_handler.h"

#define SIMD_ALIGN 32

void
convertRGB2YCbCr_v1(image_t * image_in, image_t * image_out);

void
convertRGB2YCbCr_v2(image_t * image_in, image_t * image_out);

void
convertRGB2YCbCr_SOA1(image_t * image_in, image_t * image_out);

void
convertRGB2YCbCr_block(image_t * image_in, image_t * image_out);

void
convertYCbCr2RGB(image_t * image_in, image_t * image_out);

#endif

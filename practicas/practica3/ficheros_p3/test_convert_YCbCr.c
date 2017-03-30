/* Basado en código descargado en:
 * http://www.cim.mcgill.ca/~junaed/libjpeg.php */
/* Adaptado: Jesús Alastruey Benedé
 * v1.0, 23-marzo-2017 */

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>
#include "jpeg_handler.h"
#include "include/jpeglib.h"
#include "convertRGB2YCbCr.h"
#include "misc.h"

//----------------------------------------------------------------------------

#define STRLEN 256

char in_filename[STRLEN] = "images/2013-10-02_Campo_Base_Annapurna.jpg";

static int fast = 0;
static int conv_type = 0;
static int verbose = 0;

static const char *optString = "i:c:fvh?";

static const struct option longOpts[] =
{
  {"input_filename",	required_argument,	NULL,	'i'},
  {"conversion_type",   required_argument,	NULL,	'c'},
  {"fast",              no_argument,		NULL,	'v'},
  {"verbose",           no_argument,		NULL,	'v'},
  {"help",              no_argument,		NULL,	'h'},
  {NULL,     		    0,		            NULL,    0}
};
//----------------------------------------------------------------------------

static struct option_help {
  const char *long_opt, *short_opt, *desc;
} opts_help[] = {
  { "--input_filename", "-i",
    "input filename" },
  { "--conversion_type", "-c",
    "0: YCbCr2rgb, 1: YCbCr2rgb_SOA1, 2: YCbCr2rgb_SOA2, 3: YCbCr2rgb_SOA3, 4: YCbCr2rgb_block [default = 0]" },
//    "0: YCbCr2rgb, 1: YCbCr2gray, 2: rgb2gray, 3: rgb2YCbCr [default = 0]" },
  { "--fast", "-f",
    "do not run checks [default = yes]" },
  { "--verbose", "-v",
    "generate ppm images [default = no]" },
  { "--help", "-h",
    "Show program usage"},
  { NULL, NULL, NULL }
};
//----------------------------------------------------------------------------

static void
show_usage(char *name, int exit_code)
{
  struct option_help *h;

  printf("usage: %s options\n", name);
  for (h = opts_help; h->long_opt; h++)
  {
    printf(" %s, %s\n ", h->short_opt, h->long_opt);
    printf("    %s\n", h->desc);
  }
  printf("Example:\n");
  printf("  ./test -i images/.jpg -o images/.jpg\n");

  exit(exit_code);
}
//----------------------------------------------------------------------------

static char *
remove_four(char *dst, const char *filename)
{
    size_t len = strlen(filename);
    memcpy(dst, filename, len-4);
    dst[len - 4] = 0;
    return dst;
}
//----------------------------------------------------------------------------

int
check_conversion_Color(char *base_filename, char *id_string,
                       image_t *image_out, image_t *image_ref, image_t *image_dif)
{
    int n;
    char out_filename[STRLEN] = { 0 };

    if (fast == 1) return 0;

    n = cmpColor(image_out, image_ref, image_dif);
    if (n > 0)
    {
        if (verbose) {
            /* write diff pixel values to ppm image */
            snprintf(out_filename, sizeof(out_filename), "%s_%s_dif.ppm", base_filename, id_string);
            write_PPM(out_filename, image_dif);
        }

        /* scale dif image to magnify errors */
        // scale_gray(image_dif, image_out);
        snprintf(out_filename, sizeof(out_filename), "%s_%s_dif.jpg", base_filename, id_string);
        // n = write_jpeg_file(out_filename, image_out);
        image_dif->color_space = JCS_RGB;
        n = write_jpeg_file(out_filename, image_dif);
        if (n < 0) exit(-1);
    }
    return 0;
}
//----------------------------------------------------------------------------

static int
test_convert_RGB2YCbCr()
{
    /* structs to store raw, uncompressed images and its properties (size, channels ...) */
    image_t image_RGB_in, image_YCbCr, image_RGB_out, image_dif;
    int n;
    char basename[STRLEN] = { 0 };
    char tmp_filename[STRLEN] = { 0 };

	/* open jpeg image */
	n = read_jpeg_file(in_filename, &image_RGB_in);
    if (n < 0) exit(-1);

    printf("                  Time\n");
    printf("función            (s)\tns/pix\t Gpixels/s\n");

    /* remove the last four letters of in_filename */
    remove_four(basename, in_filename);

    /* dump RGB pixel values to file */
    if (verbose) {
        snprintf(tmp_filename, STRLEN, "%s_RGB_in.ppm", basename);
        write_PPM(tmp_filename, &image_RGB_in);
    }

    /* ********************************* */
    /* RGB -> YCbCr */
    /* allocate memory to hold the converted image */
    image_YCbCr.pixels = (unsigned char*) malloc(3*image_RGB_in.width*image_RGB_in.height);

    /* convert to YCbCr */
    switch (conv_type)
    {
        case 0: convertRGB2YCbCr_v1(&image_RGB_in, &image_YCbCr);
                break;
        case 1: convertRGB2YCbCr_v2(&image_RGB_in, &image_YCbCr);
                break;
        case 2: convertRGB2YCbCr_SOA1(&image_RGB_in, &image_YCbCr);
                break;
        //case 3: convertRGB2YCbCr_SOA2(&image_RGB_in, &image_YCbCr);
        //        break;
        //case 4: convertRGB2YCbCr_SOA3(&image_RGB_in, &image_YCbCr);
        //        break;
        case 5: convertRGB2YCbCr_block(&image_RGB_in, &image_YCbCr);
                break;
        default: convertRGB2YCbCr_v1(&image_RGB_in, &image_YCbCr);
    }
    
    /* write YCbCr image to file */
    snprintf(tmp_filename, sizeof(tmp_filename), "%s_YCbCr.jpg", basename);
	n = write_jpeg_file(tmp_filename, &image_YCbCr);
    if (n < 0) exit(-1);

    /* write pixel values to ppm image */
    if (verbose) {
        snprintf(tmp_filename, STRLEN, "%s_YCbCr.ppm", basename);
        write_PPM(tmp_filename, &image_YCbCr);
    }

    /* ********************************* */
    /* YCbCr -> RGB */
    /* allocate memory to hold the converted back RGB image */
    image_RGB_out.pixels = (unsigned char*) malloc(3*image_RGB_in.width*image_RGB_in.height);

    /* convert back to RGB */
    convertYCbCr2RGB(&image_YCbCr, &image_RGB_out);

    /* write RGB image to file */
    snprintf(tmp_filename, sizeof(tmp_filename), "%s_RGB_out.jpg", basename);
	n = write_jpeg_file(tmp_filename, &image_RGB_out);
    if (n < 0) exit(-1);

    /* write pixel values to ppm image */
    if (verbose)
    {
        snprintf(tmp_filename, STRLEN, "%s_RGB_out.ppm", basename);
        write_PPM(tmp_filename, &image_RGB_out);
    }

    /* ********************************* */
    /* verify conversion */
    /* allocate memory to hold the diff image */
    image_dif.pixels = (unsigned char*) malloc(3*image_RGB_in.width*image_RGB_in.height);
    check_conversion_Color(basename, "RGB", &image_RGB_in, &image_RGB_out, &image_dif);
   
    return 0;
}
//----------------------------------------------------------------------------

int
main(int argc, char *argv[])
{
    int option;

    while(1)
    {
	    option = getopt_long(argc, argv, optString, longOpts, NULL /* &longIndex */);
        if (option == -1) break;

        switch(option)
        {
            case 'i': /* path to the input file */
                strncpy(in_filename, optarg, sizeof(in_filename));
                break;
    
            case 'c': /* conversion type */
                conv_type = strtol(optarg, NULL, 10);
                break;

            case 'f':
                fast = 1;
                break;

            case 'v':
                verbose = 1;
                break;
    
            case 'h':
                show_usage(argv[0], 0);
                break;
    
            default:
                show_usage(argv[0], 1);
        }
    }

    //printf("Verbose: %d\n", verbose);
    test_convert_RGB2YCbCr();
    exit(0);
}

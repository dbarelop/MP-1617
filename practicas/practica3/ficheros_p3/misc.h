/* Jesús Alastruey Benedé
 * 28-abril-2016 */

#ifndef CMP_GUARD

#include "jpeg_handler.h"

/* iteraciones para aumentar el tiempo de ejecución */
#define NITER 50

/* return wall time in seconds */
double
get_wall_time();

/* return cpu time in seconds */
double
get_cpu_time();

void
results(double wall_time, int height, int width, char *loop);

int
cmpGray(image_t * image_in1, image_t * image_in2, image_t * image_out);

int
cmpColor(image_t * image_in1, image_t * image_in2, image_t * image_out);

int
write_PGM(char *filename, image_t * image_in);

int
write_PPM(char *filename, image_t * image_in);

#endif

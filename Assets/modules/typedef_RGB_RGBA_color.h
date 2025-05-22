
#ifndef COLOR_H
#define COLOR_H

#include <stdint.h>

typedef struct rgba_color{
    uint8_t r, g, b, a;
} RGBA;

typedef struct rgb_color{
    uint8_t r, g, b;
} RGB;

#endif
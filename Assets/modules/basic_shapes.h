/*

basic shapes module
developed by Joscha Schörner

*/


#ifndef SHAPES_H
#define SHAPES_H

#include <GL/gl.h>

#include "typedef_RGB_RGBA_color.h"



void drawRect(float x, float y, float width, float height, RGBA color) {
	glColor4f(color.r / 255.0f, color.g / 255.0f, color.b / 255.0f, color.a / 255.0f);

	glBegin(GL_QUADS);
	glVertex2f(x, y);
	glVertex2f(x + width, y);
	glVertex2f(x + width, y + height);
	glVertex2f(x, y + height);
	glEnd();

	glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
}

#endif

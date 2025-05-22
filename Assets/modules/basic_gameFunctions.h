/*

simple game functions module
developed by Joscha Schörner

*/


#ifndef GAMEFUNCTIONS_H
#define GAMEFUNCTIONS_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <time.h>

#include <ctype.h>
#include <sys/stat.h>

#include <GL/gl.h>

#include "../libraries/stb_image.h"

#include "typedef_RGB_RGBA_color.h"

#include <stdbool.h>

// Rückgabe: true, wenn sichtbare Pixel beider Hitmaps im gleichen Bereich vorhanden sind
#include <stdbool.h>

#include <stdbool.h>

#include <stdbool.h>

bool checkHitmapOverlap(
    unsigned char* hitmapA, int widthA, int heightA, int posXA, int posYA,
    unsigned char* hitmapB, int widthB, int heightB, int posXB, int posYB
) {
    // Überlappungsbereich bestimmen
    int overlapX0 = (posXA > posXB) ? posXA : posXB;
    int overlapY0 = (posYA > posYB) ? posYA : posYB;
    int overlapX1 = ((posXA + widthA) < (posXB + widthB)) ? (posXA + widthA) : (posXB + widthB);
    int overlapY1 = ((posYA + heightA) < (posYB + heightB)) ? (posYA + heightA) : (posYB + heightB);

    // Kein gemeinsamer Bereich
    if (overlapX0 >= overlapX1 || overlapY0 >= overlapY1)
        return false;

    for (int y = overlapY0; y < overlapY1; y++) {
        for (int x = overlapX0; x < overlapX1; x++) {
            // Lokale Koordinaten
            int localXA = x - posXA;
            int localYA = y - posYA;
            int localXB = x - posXB;
            int localYB = y - posYB;

            // Index mit unterem linken Ursprung
            int indexA = localYA * widthA + localXA;
            int indexB = localYB * widthB + localXB;

            // Sicherheitscheck
            if (localXA < 0 || localXA >= widthA || localYA < 0 || localYA >= heightA) continue;
            if (localXB < 0 || localXB >= widthB || localYB < 0 || localYB >= heightB) continue;

            if (hitmapA[indexA] != 0 && hitmapB[indexB] != 0) {
                return true;
            }
        }
    }

    return false;
}




unsigned char* getHitmap(int width, int height, GLuint texture) {
	if(texture) {
	int width = 0, height = 0;
	glBindTexture(GL_TEXTURE_2D, texture);
	glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_WIDTH, &width);
	glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_HEIGHT, &height);

	unsigned char* fullPixels = (GLubyte*)malloc(width * height * 4);

	unsigned char* alphaOnly = (GLubyte*)malloc(width * height);

	glGetTexImage(GL_TEXTURE_2D, 0, GL_RGBA, GL_UNSIGNED_BYTE, fullPixels);

	for (int i = 0; i < width * height; i++) {
		alphaOnly[i] = fullPixels[i * 4 + 3] == 0 ? 0 : 1;
	}

	free(fullPixels);
	return alphaOnly;
	} else {
		unsigned char* alphaOnly = (GLubyte*)malloc(width * height);
		for (int i = 0; i < width * height; i++) {
			alphaOnly[i] = 0;
		}
		return alphaOnly;

	}
}

#endif

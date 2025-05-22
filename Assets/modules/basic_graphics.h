/*

simple graphic module
developed by Joscha Schörner

supposed to load .bmp gaphics and work with them in openGL

*/


#ifndef GRAPHICS_H
#define GRAPHICS_H

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

//----------------------------------------------------------------------------------------------------------------------------// function for png image loading

GLuint loadTextureFromPNGResource(HINSTANCE hInstance, int resourceID) {
    stbi_set_flip_vertically_on_load(1);

    HRSRC hRes = FindResource(hInstance, MAKEINTRESOURCE(resourceID), "PNG");
    if (!hRes) return 0;

    HGLOBAL hData = LoadResource(hInstance, hRes);
    if (!hData) return 0;

    DWORD imageSize = SizeofResource(hInstance, hRes);
    void* pResourceData = LockResource(hData);
    if (!pResourceData) return 0;

    int width, height, channels;
    unsigned char* imageData = stbi_load_from_memory(
        (unsigned char*)pResourceData, imageSize,
        &width, &height, &channels, STBI_rgb_alpha
    );

    if (!imageData) return 0;

    GLuint textureID;
    glGenTextures(1, &textureID);
    glBindTexture(GL_TEXTURE_2D, textureID);

    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, imageData);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

    stbi_image_free(imageData);
    return textureID;
}

//----------------------------------------------------------------------------------------------------------------------------// functions for bmp image loading

HBITMAP loadBitmapFromResource(HINSTANCE hInstance, int resourceID, int* width, int* height, void** pixelData) {
	HRSRC hResource = FindResource(hInstance, MAKEINTRESOURCE(resourceID), RT_BITMAP);
	if (!hResource) { return NULL; }
	HGLOBAL hMemory = LoadResource(hInstance, hResource);
	if (!hMemory) { return NULL; }
	BITMAPINFOHEADER* bmpInfo = (BITMAPINFOHEADER*)LockResource(hMemory);
	if (!bmpInfo) { return NULL; }
	*width = bmpInfo->biWidth;
	*height = abs(bmpInfo->biHeight);
	*pixelData = (void*)((BYTE*)bmpInfo + bmpInfo->biSize + (bmpInfo->biClrUsed * sizeof(RGBQUAD)));
	return (HBITMAP)bmpInfo;
}

unsigned char* RGB_RGBA_convert(unsigned char* imageRGB, int texWidth, int texHeight, bool isGBR, RGB transparentColor) {
	unsigned char* imageRGBA = (unsigned char*)(malloc(texWidth * texHeight * 4));

	for (int i = 0, j = 0; i < texWidth * texHeight * 3; i += 3, j += 4) {
		unsigned char r = imageRGB[i];
		unsigned char g = imageRGB[i + 1];
		unsigned char b = imageRGB[i + 2];

		imageRGBA[j] = isGBR ? b : r;
		imageRGBA[j + 1] = g;
		imageRGBA[j + 2] = isGBR ? r : b;

		imageRGBA[j + 3] = (r == transparentColor.r && g == transparentColor.g && b == transparentColor.b) ? 0 : 255;
	}

	return imageRGBA;
}

GLuint loadTextureFromBMPResource(HINSTANCE hInstance, const int tileset_identifier, RGB transparentColor) {
    int texWidth1, texHeight1, texChannels1;

    unsigned char* image1;
	HBITMAP bitmapCharacter = loadBitmapFromResource(hInstance, tileset_identifier, &texWidth1, &texHeight1, (void**)&image1);
	if (!bitmapCharacter) { return -1; }

    unsigned char* image1RGBA = RGB_RGBA_convert(image1, texWidth1, texHeight1, true, transparentColor);
	
    GLuint tileTexture1;

    glGenTextures(1, &tileTexture1);
	glBindTexture(GL_TEXTURE_2D, tileTexture1);
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, texWidth1, texHeight1, 0, GL_RGBA, GL_UNSIGNED_BYTE, image1RGBA);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

    return tileTexture1;
}

//----------------------------------------------------------------------------------------------------------------------------// functions for handling GLuint textures

void drawTile(GLuint texture, int tileX, int tileY, float tileSize, float x, float y, float size) {
	int texWidth = 0, texHeight = 0;

	glBindTexture(GL_TEXTURE_2D, texture);

	glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_WIDTH, &texWidth);
	glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_HEIGHT, &texHeight);

	float texelOffsetX = 0.1f / texWidth;
	float texelOffsetY = 0.1f / texHeight;

	float texSizeX = tileSize / texWidth;
	float texSizeY = tileSize / texHeight;

	float texX0 = tileX * texSizeX + texelOffsetX;
	float texY0 = tileY * texSizeY + texelOffsetY;
	float texX1 = texX0 + texSizeX - 2 * texelOffsetX;
	float texY1 = texY0 + texSizeY - 2 * texelOffsetY;

	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, texture);
	glBegin(GL_QUADS);
	glTexCoord2f(texX0, texY0); glVertex2f(x, y);
	glTexCoord2f(texX1, texY0); glVertex2f(x + size, y);
	glTexCoord2f(texX1, texY1); glVertex2f(x + size, y + size);
	glTexCoord2f(texX0, texY1); glVertex2f(x, y + size);
	glEnd();
	glDisable(GL_TEXTURE_2D);
}

void drawFullTexture(GLuint texture, float x, float y) {
    int texWidth = 0, texHeight = 0;

    glBindTexture(GL_TEXTURE_2D, texture);
    glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_WIDTH, &texWidth);
    glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_HEIGHT, &texHeight);

    float offsetX = 0.1f / texWidth;
    float offsetY = 0.1f / texHeight;

    float texX0 = offsetX;
    float texY0 = offsetY;
    float texX1 = 1.0f - offsetX;
    float texY1 = 1.0f - offsetY;

    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, texture);
    glBegin(GL_QUADS);
    glTexCoord2f(texX0, texY0); glVertex2f(x, y);
    glTexCoord2f(texX1, texY0); glVertex2f(x + texWidth, y);
    glTexCoord2f(texX1, texY1); glVertex2f(x + texWidth, y + texHeight);
    glTexCoord2f(texX0, texY1); glVertex2f(x, y + texHeight);
    glEnd();
    glDisable(GL_TEXTURE_2D);
}

GLuint extractTileFromTexture(GLuint tileset, int tileX, int tileY, int tileSize) {
    int texWidth = 0, texHeight = 0;

    glBindTexture(GL_TEXTURE_2D, tileset);
    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
    glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_WIDTH, &texWidth);
    glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_HEIGHT, &texHeight);

    GLubyte* tilesetPixels = (GLubyte*)malloc(texWidth * texHeight * 4);
    glGetTexImage(GL_TEXTURE_2D, 0, GL_RGBA, GL_UNSIGNED_BYTE, tilesetPixels);

    GLubyte* tilePixels = (GLubyte*)malloc(tileSize * tileSize * 4);

    for (int y = 0; y < tileSize; y++) {
        for (int x = 0; x < tileSize; x++) {
            int srcX = tileX * tileSize + x;
            int srcY = tileY * tileSize + y;
            int srcIndex = (srcY * texWidth + srcX) * 4;
            int dstIndex = (y * tileSize + x) * 4;

            tilePixels[dstIndex + 0] = tilesetPixels[srcIndex + 0];
            tilePixels[dstIndex + 1] = tilesetPixels[srcIndex + 1];
            tilePixels[dstIndex + 2] = tilesetPixels[srcIndex + 2];
            tilePixels[dstIndex + 3] = tilesetPixels[srcIndex + 3];
        }
    }

    free(tilesetPixels);

    GLuint tileTexture;
    glGenTextures(1, &tileTexture);
    glBindTexture(GL_TEXTURE_2D, tileTexture);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, tileSize, tileSize, 0, GL_RGBA, GL_UNSIGNED_BYTE, tilePixels);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

    free(tilePixels);

    return tileTexture;
}




#endif

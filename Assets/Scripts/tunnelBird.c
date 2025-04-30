#include <GLFW/glfw3.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <time.h>
#include <math.h>

#include <ctype.h>
#include <sys/stat.h>


#define block_air 0

#define block_1111_f1 1
#define block_1111_f2 2

#define block_0111_f1 3
#define block_0111_f2 4

#define block_0011_f1 5
#define block_0011_f2 6

#define block_0110_f1 7
#define block_0110_f2 8

#define block_0010_f1 9
#define block_0010_f2 10

#define block_1000_f1 11
#define block_1000_f2 12

#define block_1001_f1 13
#define block_1001_f2 14

#define block_1100_f1 15
#define block_1100_f2 16

#define block_1101_f1 17
#define block_1101_f2 18

#define block_b1 23
#define block_b2 24

#define block_plant1_d1 25
#define block_plant1_d2 26

#define block_plant2_d1 27
#define block_plant2_d2 28

#define block_plant3_d1 29
#define block_plant3_d2 30

#define block_stonePile1_d1 31
#define block_stonePile1_d2 32

#define block_stonePile2_d1 33
#define block_stonePile2_d2 34




#define WINDOW_WIDTH 854  //<54
#define WINDOW_HEIGHT 480  //30
int REAL_WINDOW_WIDTH;
int REAL_WINDOW_HEIGHT;

int refreshRate;


bool gameIsRunning = false;

double updateFrameratePrint = 0.0;
double playerDeathTime = 0.0;

double lastUpdateTime = 0.0;


#define playerAccelerationFactor 0.009
float playerAcceleration = 0;
float playerPosY = WINDOW_HEIGHT / 2;
float playerPosX = 100;
bool playerIsAlive = true;
float gravity = -980.0f;


int score = 0;
int highScore = 0;

#define gridWidth 56  //54
#define gridHeight 30  //30
#define gridLayers 3

int difficulty = 0;
float mapX = 0;
int grid[gridLayers][gridWidth][gridHeight] = {0};





#define GLFW_EXPOSE_NATIVE_WIN32
#include <GLFW/glfw3native.h>
#include <windows.h>

#define IDI_APP_ICON 101

#define TILESET_CHARACTER 12
#define TILESET_BLOCKS 13
#define TILESET_FONT 14

GLuint tileTexture1;
GLuint tileTexture2;
GLuint tileTexture3;

int texWidth1, texHeight1, texChannels1;
int texWidth2, texHeight2, texChannels2;
int texWidth3, texHeight3, texChannels3;

//####################################################################################// general functions //####################################################################################//



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

//--------------------------------------------------------------------------------------------// window icon

void setWindowIcon(GLFWwindow* window) {
    HWND hwnd = glfwGetWin32Window(window);
    HICON icon = LoadIcon(GetModuleHandle(NULL), MAKEINTRESOURCE(IDI_APP_ICON));
    if (icon) {
        SendMessage(hwnd, WM_SETICON, ICON_SMALL, (LPARAM)icon);
        SendMessage(hwnd, WM_SETICON, ICON_BIG, (LPARAM)icon);
    }
}

//--------------------------------------------------------------------------------------------// viewfield settings

void framebufferSizeCallback(GLFWwindow* window, int width, int height) {

    glViewport(0, 0, width, height);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, WINDOW_WIDTH, WINDOW_HEIGHT, 0, -1, 1);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}

//--------------------------------------------------------------------------------------------// image convert function

unsigned char* RGB_RGBA_convert(unsigned char* imageRGB, int texWidth, int texHeight, bool isGBR, unsigned char* transparentColor) {
	unsigned char* imageRGBA = (unsigned char*)(malloc(texWidth * texHeight * 4));

	for (int i = 0, j = 0; i < texWidth * texHeight * 3; i += 3, j += 4) {
        unsigned char r = imageRGB[i];
        unsigned char g = imageRGB[i + 1];
        unsigned char b = imageRGB[i + 2];

        imageRGBA[j] = isGBR ? b : r;
        imageRGBA[j + 1] = g;
        imageRGBA[j + 2] = isGBR ? r : b;

        imageRGBA[j + 3] = (r == transparentColor[0] && g== transparentColor[1] && b == transparentColor[2]) ? 0 : 255;
    }

	return imageRGBA;
}

//--------------------------------------------------------------------------------------------// draw tile function

void drawTile(GLuint texture, int tileX, int tileY, float tileSize, float x, float y, float size) {
	int texWidth = 0, texHeight = 0;

	glBindTexture(GL_TEXTURE_2D, texture);
    

	glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_WIDTH, &texWidth);
	glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_HEIGHT, &texHeight);

	// Texel-Offset against Sampling-Problem
	float texelOffsetX = 0.1f / texWidth;
	float texelOffsetY = 0.1f / texHeight;

	float texSizeX = tileSize / texWidth;
	float texSizeY = tileSize / texHeight;

	float texX0 = tileX * texSizeX + texelOffsetX;
	float texY0 = 1.0f - (tileY + 1) * texSizeY + texelOffsetY;
	float texX1 = texX0 + texSizeX - 2 * texelOffsetX;
	float texY1 = texY0 + texSizeY - 2 * texelOffsetY;

	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, texture);
	glBegin(GL_QUADS);
		glTexCoord2f(texX0, texY0); glVertex2f(x, y + size);
		glTexCoord2f(texX1, texY0); glVertex2f(x + size, y + size);
		glTexCoord2f(texX1, texY1); glVertex2f(x + size, y);
		glTexCoord2f(texX0, texY1); glVertex2f(x, y);
	glEnd();
	glDisable(GL_TEXTURE_2D);
}

//--------------------------------------------------------------------------------------------// rectangle draw

void drawRect(float x, float y, float width, float height, unsigned char* color) {

	glDisable(GL_TEXTURE_2D);

	glColor4f(
		color[0] / 255.0f,
		color[1] / 255.0f,
		color[2] / 255.0f,
		color[3] / 255.0f
	);

	glBegin(GL_QUADS);
		glVertex2f(x, y);
		glVertex2f(x + width, y);
		glVertex2f(x + width, y + height);
		glVertex2f(x, y + height);
	glEnd();

	glEnable(GL_TEXTURE_2D);

	glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
}

//--------------------------------------------------------------------------------------------// font rendering

const char* fontOrder = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

int indexOf(const char* pool, char object) {
    for (int i = 0; pool[i] != '\0'; i++) {
        if (pool[i] == object) return i;
    }
    return -1; // Not found
}

void showText(const char* text, int x, int y, int size, int colorLine) {
    for (int i = 0; text[i] != '\0'; i++) {
        int index = indexOf(fontOrder, text[i]);
        if (index != -1) {
            drawTile(tileTexture3, index, colorLine, 8, x + i * size, y, size);
        }
    }
}

void showNumber(int number, int x, int y, int size, int colorLine) {
	char numStr[12];
	snprintf(numStr, sizeof(numStr), "%d", number);
	showText(numStr, x, y, size, colorLine);
}


//####################################################################################// game functions //####################################################################################//


//--------------------------------------------------------------------------------------------// map functions background


int getBackgroundBlock() {
	int randNum = (rand() % (100 - 0 + 1)) + 0;
	if (randNum > 50) {return block_b1; } else {return block_b2; }
}

void generateNewLineBackground(int linePosX) {
	for (int y = 0; y < gridHeight; y++) {
		grid[0][linePosX][y] = getBackgroundBlock();
	}
}

//--------------------------------------------------------------------------------------------// map functions foreground

int directionSurface;
int directionRoof;

int surfaceBlockY;
int lastSurfaceBlockY;

int roofBlockY;
int lastRoofBlockY;

const int difficultyValues[3][10] = {{20, 20, 20, 16, 16, 16, 15, 15, 15, 14}, {19, 18, 17, 17, 16, 15, 14, 13, 12, 11}, {16, 15, 14, 13, 12, 12, 11, 10, 9, 8}};



int getForegroundBlock(bool block_top, bool block_right, bool block_bottom, bool block_left) {

	int randNum = (rand() % (100 - 0 + 1)) + 0;

	int block = 0;
	if (block_top)    block |= 1 << 3; // Bit 3 = oben
	if (block_right)  block |= 1 << 2; // Bit 2 = rechts
	if (block_bottom) block |= 1 << 1; // Bit 1 = unten
	if (block_left)   block |= 1 << 0; // Bit 0 = links

	switch (block) {
		case 0b1111:
		if (randNum > 50) {return block_1111_f1; } else {return block_1111_f2; }
		case 0b0111:
		if (randNum > 50) {return block_0111_f1; } else {return block_0111_f2; }
		case 0b0011:
		if (randNum > 50) {return block_0011_f1; } else {return block_0011_f2; }
		case 0b0110:
		if (randNum > 50) {return block_0110_f1; } else {return block_0110_f2; }
		case 0b0010:
		if (randNum > 50) {return block_0010_f1; } else {return block_0010_f2; }
		case 0b1010:
		if (randNum > 50) {return block_1111_f1; } else {return block_1111_f2; }
		case 0b1011:
		if (randNum > 50) {return block_1111_f1; } else {return block_1111_f2; }
		case 0b1110:
		if (randNum > 50) {return block_1111_f1; } else {return block_1111_f2; }
		case 0b1101:
		if (randNum > 50) {return block_1101_f1; } else {return block_1101_f2; }
		case 0b1100:
		if (randNum > 50) {return block_1100_f1; } else {return block_1100_f2; }
		case 0b1001:
		if (randNum > 50) {return block_1001_f1; } else {return block_1001_f2; }
		case 0b1000:
		if (randNum > 50) {return block_1000_f1; } else {return block_1000_f2; }

		default:
		return -1;
	}

	return block;
}



void generateNewLineForeground(int linePosX) {

	for (int y = 0; y < gridHeight; y++) {
		grid[1][linePosX][y] = 0;
	}

	if (linePosX == 0) {
		directionSurface = (rand() % (3 - 1 + 1)) + 1;  // up, straight, down
		directionRoof = (rand() % (3 - 1 + 1)) + 1;  // up, straight, down
		surfaceBlockY = (rand() % (29 - 24 + 1)) + 24;
		roofBlockY = (rand() % (4 - 0 + 1)) + 0;
	} else {

		if ((rand() % (100 - 0 + 1)) + 0 > 80) {
			directionSurface = (rand() % (3 - 1 + 1)) + 1;
		}

		if (lastSurfaceBlockY < difficultyValues[0][difficulty]) {  //16 //20
			directionSurface = (rand() % (3 - 2 + 1)) + 2;
		}
		if (lastSurfaceBlockY > 25) {
			directionSurface = (rand() % (2 - 1 + 1)) + 1;
		}

		if (lastSurfaceBlockY < 28) {
			if (directionSurface == 1) {
				surfaceBlockY = (rand() % (lastSurfaceBlockY - (lastSurfaceBlockY - 2) + 1)) + lastSurfaceBlockY - 2;
			} else if (directionSurface == 2) {
				surfaceBlockY = (rand() % ((lastSurfaceBlockY + 1) - (lastSurfaceBlockY - 1) + 1)) + lastSurfaceBlockY - 1;
			} else if (directionSurface == 3) {
				surfaceBlockY = (rand() % ((lastSurfaceBlockY + 2) - lastSurfaceBlockY + 1)) + lastSurfaceBlockY + 1;
			}
		} else {
			surfaceBlockY = (rand() % (29 - 27 + 1)) + 27;
		}


		if ((rand() % (100 - 0 + 1)) + 0 > 85) {
			directionRoof = (rand() % (3 - 1 + 1)) + 1;
		}


		if (surfaceBlockY - lastRoofBlockY > difficultyValues[1][difficulty]) {  //12 //14 //18 //18
			directionRoof = (rand() % (3 - 2 + 1)) + 2;
		} else if (surfaceBlockY - lastRoofBlockY > difficultyValues[2][difficulty]) { //8 //10 //10 //14
			directionRoof = (rand() % (2 - 1 + 1)) + 1;
		} else {
			directionRoof = 1;
		}
		if (lastRoofBlockY < 3) {
			directionRoof = (rand() % (3 - 2 + 1)) + 2;
		}

		if (lastRoofBlockY > 1) {
			if (directionRoof == 1) {
				roofBlockY = (rand() % ((lastRoofBlockY - 1) - (lastRoofBlockY - 2) + 1)) + lastRoofBlockY - 2;
			} else if (directionRoof == 2) {
				roofBlockY = (rand() % ((lastRoofBlockY + 1) - (lastRoofBlockY - 1) + 1)) + lastRoofBlockY - 1;
			} else if (directionRoof == 3) {
				roofBlockY = (rand() % ((lastRoofBlockY + 2) - lastRoofBlockY+1 + 1)) + lastRoofBlockY + 1;
			}
		} else {
			roofBlockY = (rand() % (2 - 0 + 1)) + 0;
		}
	}

	for (int i = 0; i < gridHeight; i++) {
		if (i <= roofBlockY || i >= surfaceBlockY) {
			grid[1][linePosX][i] = block_1111_f1;
		}
	}

	if(linePosX != 0) {
		for (int i = 0; i < gridHeight; i++) {
			if (i < lastRoofBlockY || i > lastSurfaceBlockY) {
				grid[1][linePosX-1][i] = getForegroundBlock(true, grid[1][linePosX][i] != block_air ? true : false, true, grid[1][linePosX-2][i] != block_air ? true : false);
			}
			if (i == lastRoofBlockY) {
				grid[1][linePosX-1][i] = getForegroundBlock(true, grid[1][linePosX][i] != block_air ? true : false, false, grid[1][linePosX-2][i] != block_air ? true : false);
			}
			if (i == lastSurfaceBlockY) {
				grid[1][linePosX-1][i] = getForegroundBlock(false, grid[1][linePosX][i] != block_air ? true : false, true, grid[1][linePosX-2][i] != block_air ? true : false);
			}
		}
	}


	lastSurfaceBlockY = surfaceBlockY;
	lastRoofBlockY = roofBlockY;
}

int getPlant() {
	int randNum = (rand() % (14 - 0 + 1)) + 0;
	switch(randNum) {
		case 0:
		return block_plant1_d1;
		case 1:
		return block_plant1_d2;
		case 2:
		return block_plant2_d1;
		case 3:
		return block_plant2_d2;
		case 4:
		return block_plant3_d1;
		case 5:
		return block_plant3_d2;
		case 6:
		return block_stonePile1_d1;
		case 7:
		return block_stonePile1_d2;
		case 8:
		return block_stonePile2_d1;
		case 9:
		return block_stonePile2_d2;

		default:
		return block_air;
	}
}

void setPlants(int linePosX) {
	for (int i = 0; i < gridHeight; i++) {
		grid[2][linePosX][i] = block_air;

		if (grid[1][linePosX][i] == block_0111_f1 || grid[1][linePosX][i] == block_0111_f2) {

			grid[2][linePosX][i-1] = getPlant();
		}
	}
}

//--------------------------------------------------------------------------------------------// map functions general


void updateWorld() {
	if (mapX <= -16) {
		mapX = 0;
		
		for (int x = 1; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				grid[1][x-1][y] = grid[1][x][y];
			}
		}
		
		for (int x = 1; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				grid[0][x-1][y] = grid[0][x][y];
			}
		}

		for (int x = 1; x < gridWidth - 1; x++) {
			for (int y = 0; y < gridHeight; y++) {
				grid[2][x-1][y] = grid[2][x][y];
			}
		}
		
		generateNewLineForeground(gridWidth - 1);
		generateNewLineBackground(gridWidth - 1);
		setPlants(gridWidth - 2);
		
		score++;

		if (score < 50) {
			difficulty = 0;
		} else if (score < 100) {
			difficulty = 1;
		} else if (score < 150) {
			difficulty = 2;
		} else if (score < 200) {
			difficulty = 3;
		} else if (score < 250) {
			difficulty = 4;
		} else if (score < 300) {
			difficulty = 5;
		} else if (score < 350) {
			difficulty = 6;
		} else if (score < 400) {
			difficulty = 7;
		} else if (score < 450) {
			difficulty = 8;
		} else if (score > 449) {
			difficulty = 9;
		}
	}
	float deltaTime = 1.0F / refreshRate;
	mapX -= 60*deltaTime;
}

void drawWorld() {
	
	for (int x = 0; x < gridWidth; x++) {
		for (int y = 0; y < gridHeight; y++) {

			if (grid[1][x][y] != block_1111_f1 && grid[1][x][y] != block_1111_f2) {
				if (grid[0][x][y] == block_b1) {
					drawTile(tileTexture2,3,1,16,(x*16)+mapX,(y*16),16);
				} else if (grid[0][x][y] == block_b2) {
					drawTile(tileTexture2,3,3,16,(x*16)+mapX,(y*16),16);
				}
			}

			switch (grid[1][x][y]) {
				case block_air:
                    break;

                case block_1111_f1:
                    drawTile(tileTexture2, 1, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_0111_f1:
                    drawTile(tileTexture2, 5, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_0011_f1:
                    drawTile(tileTexture2, 9, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_0110_f1:
                    drawTile(tileTexture2, 7, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_0010_f1:
                    drawTile(tileTexture2, 11, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_1101_f1:
                    drawTile(tileTexture2, 13, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_1100_f1:
                    drawTile(tileTexture2, 15, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_1001_f1:
                    drawTile(tileTexture2, 17, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_1000_f1:
                    drawTile(tileTexture2, 19, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;

				case block_1111_f2:
                    drawTile(tileTexture2, 1, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_0111_f2:
                    drawTile(tileTexture2, 5, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_0011_f2:
                    drawTile(tileTexture2, 9, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_0110_f2:
                    drawTile(tileTexture2, 7, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_0010_f2:
                    drawTile(tileTexture2, 11, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_1101_f2:
                    drawTile(tileTexture2, 13, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_1100_f2:
                    drawTile(tileTexture2, 15, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_1001_f2:
                    drawTile(tileTexture2, 17, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_1000_f2:
                    drawTile(tileTexture2, 19, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
			
				default:
					// error
					break;
            }

			switch (grid[2][x][y]) {
				case block_air:
                    break;

                case block_plant1_d1:
                    drawTile(tileTexture2, 21, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_plant1_d2:
                    drawTile(tileTexture2, 21, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_plant2_d1:
                    drawTile(tileTexture2, 23, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_plant2_d2:
                    drawTile(tileTexture2, 23, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_plant3_d1:
                    drawTile(tileTexture2, 25, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_plant3_d2:
                    drawTile(tileTexture2, 25, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_stonePile1_d1:
                    drawTile(tileTexture2, 27, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_stonePile1_d2:
                    drawTile(tileTexture2, 27, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_stonePile2_d1:
                    drawTile(tileTexture2, 29, 1, 16, (x*16)+mapX, (y*16), 16);
                    break;
				case block_stonePile2_d2:
                    drawTile(tileTexture2, 29, 3, 16, (x*16)+mapX, (y*16), 16);
                    break;
				
				default:
					// error
					break;
            }
		}
	}
}

//--------------------------------------------------------------------------------------------// proof player f_block collision

bool proofCollision(float playerPosX, float playerPosY) {
	int currentPlayerPointX0 = (int) floor((playerPosX + 2 - mapX) / 16);
	int currentPlayerPointY0 = (int) floor((playerPosY + 4) / 16);
	int currentPlayerPointX1 = (int) floor((playerPosX + 14 - mapX) / 16);
	int currentPlayerPointY1 = (int) floor((playerPosY + 14) / 16);
	
	if(grid[1][currentPlayerPointX0][currentPlayerPointY0] != block_air ||
		grid[1][currentPlayerPointX1][currentPlayerPointY0] != block_air ||
		grid[1][currentPlayerPointX1][currentPlayerPointY1] != block_air ||
		grid[1][currentPlayerPointX0][currentPlayerPointY1] != block_air
	) {
		return true;
	} else {
		return false;
	}
}

//--------------------------------------------------------------------------------------------// player functions

void updatePlayer() {

	if (playerIsAlive == true) {
		float deltaTime = 1.0f / (float)refreshRate;			
		playerAcceleration += gravity * deltaTime;
		float movementHeight = playerAcceleration * deltaTime + 0.5f * gravity * deltaTime * deltaTime;

		if (proofCollision(playerPosX, playerPosY - movementHeight) == true) {
			for (int i = 0; i < fabs(movementHeight)+1; i++) {

				if (proofCollision(playerPosX, playerPosY + (movementHeight > 0 ? -1 : +1)) != true) {
					playerPosY += (movementHeight > 0 ? -1 : +1);
				} else {
					playerDeathTime = glfwGetTime();
					playerIsAlive = false;
					gameIsRunning = false;
					break;
				}
			}
		} else {
			playerPosY -= movementHeight;
		}

	}
}

void drawPlayer() {
	drawTile(tileTexture1,0,0,16,playerPosX,playerPosY,16); //posx, posy, size, posX, posY, size
}

//--------------------------------------------------------------------------------------------// reset player and map

void resetGame() {
	playerAcceleration = 0;
	playerPosY = WINDOW_HEIGHT / 2;
	mapX = 0;
	difficulty = 0;
	playerIsAlive = true;

	if (score > highScore) {
		highScore = score;
	}
	score = 0;
	
	for (int x = 0; x < gridWidth; x++) {
		generateNewLineBackground(x);
		generateNewLineForeground(x);
		if (x > 0) {
			setPlants(x-1);
		}
	}
}

//####################################################################################// input functions //####################################################################################//

//--------------------------------------------------------------------------------------------// get keys

void keyCallback(GLFWwindow* window, int key, int scancode, int action, int mods) {
    if (action == GLFW_PRESS) switch (key) {
		case GLFW_KEY_UP:
		case GLFW_KEY_W:
		case GLFW_KEY_SPACE:
			if (playerIsAlive == false && gameIsRunning == false) {
				if (glfwGetTime() - playerDeathTime >= 1) {
					resetGame();
				}
			} else if (gameIsRunning == false) {
				gameIsRunning = true;
			}
			if (playerIsAlive == true) {
				playerAcceleration = 300.0F;
			}
			break;
		case GLFW_KEY_ESCAPE:
			glfwSetWindowShouldClose(window, GLFW_TRUE);
			break;
		default:
			break;
		
    }
}

//--------------------------------------------------------------------------------------------// get mouse keys

void mouseButtonCallback(GLFWwindow* window, int button, int action, int mods) {
	// nothing
}

//####################################################################################// main + gameloop //####################################################################################//

int main(int argc, char* argv[], char* envp[]) {

	GLFWwindow* window;
    printf("is running");
    fflush(stdout);

    if (!glfwInit()) { return -1; }
	
	GLFWmonitor* primaryMonitor = glfwGetPrimaryMonitor();
    const GLFWvidmode* mode = glfwGetVideoMode(primaryMonitor);
	
	REAL_WINDOW_WIDTH = mode->width;
	REAL_WINDOW_HEIGHT = mode->height;

	refreshRate = mode->refreshRate;

	glfwWindowHint(GLFW_REFRESH_RATE, refreshRate);

  

	window = glfwCreateWindow(REAL_WINDOW_WIDTH, REAL_WINDOW_HEIGHT, "tunnelBird", primaryMonitor, NULL);
	
    if (!window) { glfwTerminate(); return -1; }
    glfwMakeContextCurrent(window);
	
	glfwSwapInterval(1);
    
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);


    
    HINSTANCE hInstance = GetModuleHandle(NULL);
	
    unsigned char* image1;
    HBITMAP bitmapCharacter = loadBitmapFromResource(hInstance, TILESET_CHARACTER, &texWidth1, &texHeight1, (void**)&image1);
    if (!bitmapCharacter) { return -1; }
    bool isGBR1 = true;
	
	unsigned char* image2;
    HBITMAP bitmapBlocks = loadBitmapFromResource(hInstance, TILESET_BLOCKS, &texWidth2, &texHeight2, (void**)&image2);
    if (!bitmapBlocks) { return -1; }
    bool isGBR2 = true;
	
	unsigned char* image3;
    HBITMAP bitmapFont = loadBitmapFromResource(hInstance, TILESET_FONT, &texWidth3, &texHeight3, (void**)&image3);
    if (!bitmapFont) { return -1; }
    bool isGBR3 = true;

	unsigned char transparentColor[] = {255, 0, 255};

    unsigned char* image1RGBA = RGB_RGBA_convert(image1, texWidth1, texHeight1, isGBR1, transparentColor);
	unsigned char* image2RGBA = RGB_RGBA_convert(image2, texWidth2, texHeight2, isGBR2, transparentColor);
	unsigned char* image3RGBA = RGB_RGBA_convert(image3, texWidth3, texHeight3, isGBR3, transparentColor);
	
	
    
    glEnable(GL_TEXTURE_2D);
	
    glGenTextures(1, &tileTexture1);
    glBindTexture(GL_TEXTURE_2D, tileTexture1);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, texWidth1, texHeight1, 0, GL_RGBA, GL_UNSIGNED_BYTE, image1RGBA);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	
	glGenTextures(1, &tileTexture2);
	glBindTexture(GL_TEXTURE_2D, tileTexture2);
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, texWidth2, texHeight2, 0, GL_RGBA, GL_UNSIGNED_BYTE, image2RGBA);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	
	glGenTextures(1, &tileTexture3);
	glBindTexture(GL_TEXTURE_2D, tileTexture3);
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, texWidth3, texHeight3, 0, GL_RGBA, GL_UNSIGNED_BYTE, image3RGBA);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

    
    glfwSetFramebufferSizeCallback(window, framebufferSizeCallback);
    glfwSetKeyCallback(window, keyCallback);
    glfwSetMouseButtonCallback(window, mouseButtonCallback);
    setWindowIcon(window);
    framebufferSizeCallback(window, REAL_WINDOW_WIDTH, REAL_WINDOW_HEIGHT);

    resetGame();

	float currentFramerate = 0.0;
	
    while (!glfwWindowShouldClose(window)) {

		double currentTime = glfwGetTime();
		if (currentTime - updateFrameratePrint >= 0.2) {
			currentFramerate = 1.0F / (currentTime - lastUpdateTime);
			updateFrameratePrint = currentTime;
		}
		lastUpdateTime = currentTime;

		
        glClear(GL_COLOR_BUFFER_BIT);
					
		drawWorld();
		drawPlayer();


		
		showNumber((int)currentFramerate, WINDOW_WIDTH - 62, 5, 9, 1);
		showText("FPS", WINDOW_WIDTH - 30, 5, 9, 1);


		if(gameIsRunning && playerIsAlive) {
			updateWorld();
			updatePlayer();

			showText("SCORE", 5, 5, 9, 1);
			showNumber(score, 65, 5, 9, 1);
			showText("HIGHSCORE", 150, 5, 9, 1);
			showNumber(highScore, 250, 5, 9, 1);

		} else if (playerIsAlive) {
			showText("SCORE", 5, 5, 9, 1);
			showNumber(score, 65, 5, 9, 1);
			showText("HIGHSCORE", 150, 5, 9, 1);
			showNumber(highScore, 250, 5, 9, 1);

			showText("PRESS JUMP KEY TO START", (WINDOW_WIDTH / 2) - 115, 450, 10, 1);

		} else {
			unsigned char color[] = {50, 50, 50, 220};
			drawRect((WINDOW_WIDTH / 2) - 100, 100, 200, 250, color);

			showText("GAME OVER", (WINDOW_WIDTH / 2) - 90, 110, 11, 2);

			if (score != 0 && score > highScore) {
				showText("NEW HIGHSCORE", (WINDOW_WIDTH / 2) - 90, 150, 7, 4);
				showNumber(score, (WINDOW_WIDTH / 2) - 90, 170, 7, 4);
			} else if (score != 0) {
				showText("SCORE", (WINDOW_WIDTH / 2) - 90, 150, 7, 1);
				showNumber(score, (WINDOW_WIDTH / 2) - 90, 170, 7, 1);

				showText("HIGHSCORE", (WINDOW_WIDTH / 2) - 90, 210, 7, 1);
				showNumber(highScore, (WINDOW_WIDTH / 2) - 90, 230, 7, 1);
			}

			showText("PRESS JUMP KEY TO CONTINOU", (WINDOW_WIDTH / 2) - 90, 337, 7, 1);
		}

		
		glfwSwapBuffers(window);
		
        glfwPollEvents();
    }
    
    glfwTerminate();
    
    glDeleteTextures(1, &tileTexture1);
	glDeleteTextures(1, &tileTexture2);
	glDeleteTextures(1, &tileTexture3);
    
    free(image1RGBA);
	free(image2RGBA);
	free(image3RGBA);

	
    return 0;
}
#include <GLFW/glfw3.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <time.h>
#include <math.h>

#include <ctype.h>
#include <sys/stat.h>

#define WINDOW_WIDTH 854  //<54
#define WINDOW_HEIGHT 480  //30
int REAL_WINDOW_WIDTH;
int REAL_WINDOW_HEIGHT;

int refreshRate;

float speedFactor;

bool gameStarted = false;

double lastUpdateTime = 0.0;
double deltaTime;


#define playerAccelerationFactor 0.009
float playerAcceleration = 0;
float playerPosY = WINDOW_HEIGHT / 2;
float playerPosX = 100;
bool playerIsAlive = true;
float gravity = -980.0f;


int score = 0;
int lastScore = 0;
int highScore = 0;

#define gridWidth 55  //54
#define gridHeight 30  //30
#define gridLayers 2

float mapX = 0;
int grid[gridLayers][gridWidth][gridHeight] = {0};

typedef struct {
	char* name;
    int x;
    int y;
} block_struct;

const block_struct block_grass = {"grass", 0, 1}; //test


#define block_air 0
#define block_stone1 1
#define block_stone2 2

#define block_grassTop1 3
#define block_grassTop2 4
#define block_grassLeft1 5
#define block_grassLeft2 6
#define block_grassRight1 7
#define block_grassRight2 8
#define block_grassOnly1 9
#define block_grassOnly2 10

#define block_bottom1 11
#define block_bottom2 12
#define block_bottomLeft1 13
#define block_bottomLeft2 14
#define block_bottomRight1 15
#define block_bottomRight2 16
#define block_bottomOnly1 17
#define block_bottomOnly2 18

#define block_stoneBackground1 19
#define block_stoneBackground2 20



#ifdef _WIN32

#define GLFW_EXPOSE_NATIVE_WIN32
#include <GLFW/glfw3native.h>
#include <windows.h>

#define IDI_APP_ICON 101

#define TILESET_CHARACTER 12
#define TILESET_BLOCKS 13
#define TILESET_FONT 14

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

void setWindowIcon(GLFWwindow* window) {
    HWND hwnd = glfwGetWin32Window(window);
    HICON icon = LoadIcon(GetModuleHandle(NULL), MAKEINTRESOURCE(IDI_APP_ICON));
    if (icon) {
        SendMessage(hwnd, WM_SETICON, ICON_SMALL, (LPARAM)icon);
        SendMessage(hwnd, WM_SETICON, ICON_BIG, (LPARAM)icon);
    }
}

#else

#define CHARACTER_TILESET "character.bmp"
#define BLOCKS_TILESET "character.bmp"
#define FONT_TILESET "character.bmp"

#define STB_IMAGE_IMPLEMENTATION
#include "stbimage.h"
void setWindowIcon(GLFWwindow* window) {}
#endif


GLuint tileTexture1;
GLuint tileTexture2;
GLuint tileTexture3;
GLuint backgroundScreen;

int texWidth1, texHeight1, texChannels1;
int texWidth2, texHeight2, texChannels2;
int texWidth3, texHeight3, texChannels3;



unsigned char* RGB_RGBA_convert(unsigned char* imageRGB, int texWidth, int texHeight, bool isGBR, unsigned char* transparentColor) {
	unsigned char* imageRGBA = (unsigned char*)(malloc(texWidth * texHeight * 4));

	for (int i = 0, j = 0; i < texWidth * texHeight * 3; i += 3, j += 4) {
        unsigned char r = imageRGB[i];
        unsigned char g = imageRGB[i + 1];
        unsigned char b = imageRGB[i + 2];

        imageRGBA[j] = isGBR ? b : r;
        imageRGBA[j + 1] = g;
        imageRGBA[j + 2] = isGBR ? r : b;

        imageRGBA[j + 3] = (r == transparentColor[0] && g == transparentColor[1] && b == transparentColor[2]) ? 0 : 255;
    }

	return imageRGBA;
}


float getIngameSpeed(float speed) {  //pps

	return 1.0F / (float)refreshRate * (float)speed;
}

void mouseButtonCallback(GLFWwindow* window, int button, int action, int mods) {

}

void keyCallback(GLFWwindow* window, int key, int scancode, int action, int mods) {
    if (action == GLFW_PRESS) switch (key) {
        case GLFW_KEY_UP:
        case GLFW_KEY_W:
            if (playerPosY < WINDOW_HEIGHT) {
                playerAcceleration = 300.0F;
            }
            break;
		case GLFW_KEY_R:
			playerPosY = WINDOW_HEIGHT / 2;
			playerAcceleration = 0;
			for (int x = 0; x < gridWidth; x++) {
				for (int y = 0; y < gridHeight; y++) {
					grid[1][x][y] = 0;
				}
			}
            playerIsAlive = true;
            break;
        case GLFW_KEY_ESCAPE:
            glfwSetWindowShouldClose(window, GLFW_TRUE);
            break;
        default:
            break;
    }
}

void framebufferSizeCallback(GLFWwindow* window, int width, int height) {
    glViewport(0, 0, width, height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();	
    glOrtho(0, WINDOW_WIDTH, WINDOW_HEIGHT, 0, -1, 1);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}



void drawTexture(GLuint texture, float x, float y) {
    int texWidth = 0, texHeight = 0;
    glBindTexture(GL_TEXTURE_2D, texture);
    glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_WIDTH, &texWidth);
    glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_HEIGHT, &texHeight);

    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, texture);
    glBegin(GL_QUADS);

#ifdef _WIN32
    // Flip vertically if needed
	glTexCoord2f(0.0f, 0.0f); glVertex2f(x, y + texHeight);
    glTexCoord2f(1.0f, 0.0f); glVertex2f(x + texWidth, y + texHeight);
    glTexCoord2f(1.0f, 1.0f); glVertex2f(x + texWidth, y);
    glTexCoord2f(0.0f, 1.0f); glVertex2f(x, y);
#else
    // Standard OpenGL (0,0 is bottom-left)
    glTexCoord2f(0.0f, 1.0f); glVertex2f(x, y + texHeight);
    glTexCoord2f(1.0f, 1.0f); glVertex2f(x + texWidth, y + texHeight);
    glTexCoord2f(1.0f, 0.0f); glVertex2f(x + texWidth, y);
    glTexCoord2f(0.0f, 0.0f); glVertex2f(x, y);
#endif

    glEnd();
    glDisable(GL_TEXTURE_2D);
}

bool proofCollision(float playerPosX, float playerPosY) {
	int currentPlayerPointX = (int) floor((playerPosX - mapX) / 16);
	int currentPlayerPointY = (int) floor(playerPosY / 16);
	
	if(grid[1][currentPlayerPointX][currentPlayerPointY] != block_air ||
		grid[1][currentPlayerPointX + 1][currentPlayerPointY] != block_air ||
		grid[1][currentPlayerPointX + 1][currentPlayerPointY + 1] != block_air ||
		grid[1][currentPlayerPointX][currentPlayerPointY + 1] != block_air
	) {
		return true;
	} else {
		return false;
	}
}



void drawTile(GLuint texture, int tileX, int tileY, float tileSize, float x, float y, float size) {
	int texWidth = 0, texHeight = 0;
	
	glBindTexture(GL_TEXTURE_2D, texture);
	glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_WIDTH, &texWidth);
	glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_HEIGHT, &texHeight);

#ifdef _WIN32
    float texX = tileX * tileSize / texWidth;
    float texY = texHeight - (tileY + 1) * tileSize / texHeight;
#else
    float texX = tileX * tileSize / texWidth;
    float texY = tileY * tileSize / texHeight;
#endif
    float texSizeX = tileSize / texWidth;
    float texSizeY = tileSize / texHeight;

    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, texture);
    glBegin(GL_QUADS);
	
#ifdef _WIN32	
		glTexCoord2f(texX, texY); glVertex2f(x, y + size);
        glTexCoord2f(texX + texSizeX, texY); glVertex2f(x + size, y + size);
        glTexCoord2f(texX + texSizeX, texY + texSizeY); glVertex2f(x + size, y);
		glTexCoord2f(texX, texY + texSizeY); glVertex2f(x, y);
#else
		glTexCoord2f(texX, texY); glVertex2f(x, y);
        glTexCoord2f(texX + texSizeX, texY); glVertex2f(x + size, y);
        glTexCoord2f(texX + texSizeX, texY + texSizeY); glVertex2f(x + size, y + size);
        glTexCoord2f(texX, texY + texSizeY); glVertex2f(x, y + size);
#endif
    glEnd();
    glDisable(GL_TEXTURE_2D);
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
					playerIsAlive = false;
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

//--------------------------------------------------------------------------------------------// map functions background

int getBackgroundBlock() {
	int lower = 0;
	int upper = 100;
	int randNum = (rand() % (upper - lower + 1)) + lower;

	if (randNum <= 60) {
		return block_stoneBackground1;
	} else{
		return block_stoneBackground2;
	}
}

void generateNewLineBackground(int linePosX) {
	for (int y = 0; y < gridHeight; y++) {
		grid[0][linePosX][y] = getBackgroundBlock();
	}
}

//--------------------------------------------------------------------------------------------// map functions foreground

int getForegroundBlock(int blocK_top, int block_right, int block_bottom, int block_left) {
	int lower = 0;
	int upper = 100;
	int randNum = (rand() % (upper - lower + 1)) + lower;

	if (randNum <= 60) {
		return block_stone1;
	} else{
		return block_stone2;
	}
}

int directionSurface;
int directionRoof;

int surfaceBlockY;
int lastSurfaceBlockY;

int roofBlockY;
int lastRoofBlockY;



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

		if (lastSurfaceBlockY < 16) {  //16 //20
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


		if (surfaceBlockY - lastRoofBlockY > 14) {  //12 //14 //18 //18
			directionRoof = (rand() % (3 - 2 + 1)) + 2;
		} else if (surfaceBlockY - lastRoofBlockY > 10) { //8 //10 //10 //14
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

	grid[1][linePosX][surfaceBlockY] = block_stone1;
	grid[1][linePosX][roofBlockY] = block_stone2;


	lastSurfaceBlockY = surfaceBlockY;
	lastRoofBlockY = roofBlockY;

	int lower = 0;
	int upper = 100;
	int randNum = (rand() % (upper - lower + 1)) + lower;


}

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
		
		generateNewLineForeground(gridWidth - 1);
		generateNewLineBackground(gridWidth - 1);
		
	}
	float deltaTime = 1.0F / refreshRate;
	mapX -= 60*deltaTime;
}

void drawWorld() {
	
	for (int x = 0; x < gridWidth; x++) {
		for (int y = 0; y < gridHeight; y++) {
			if (grid[0][x][y] == block_stoneBackground1) {
				drawTile(tileTexture2,3,1,16,(x*16)+mapX,(y*16),16); //posx, posy, size, posX, posY, size
			}
			if (grid[0][x][y] == block_stoneBackground2) {
				drawTile(tileTexture2,3,3,16,(x*16)+mapX,(y*16),16); //posx, posy, size, posX, posY, size
			}

			if (grid[1][x][y] == block_stone1) {
				drawTile(tileTexture2,1,1,16,(x*16)+mapX,(y*16),16); //posx, posy, size, posX, posY, size
			}
			if (grid[1][x][y] == block_stone2) {
				drawTile(tileTexture2,5,3,16,(x*16)+mapX,(y*16),16); //posx, posy, size, posX, posY, size
			}
		}
	}
}



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

		

int main(int argc, char* argv[], char* envp[]) { GLFWwindow* window;
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
	
	// images
    
#ifdef _WIN32
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
#else
    unsigned char* image1 = stbi_load(CHARACTER_TILESET, &texWidth1, &texHeight1, &texChannels1, STBI_rgb);
    if (!image) { return -1; }
    bool isGBR1 = false;
	
	unsigned char* image2 = stbi_load(BLOCKS_TILESET, &texWidth2, &texHeight2, &texChannels2, STBI_rgb);
    if (!image) { return -1; }
    bool isGBR2 = false;
	
	unsigned char* image3 = stbi_load(FONT_TILESET, &texWidth3, &texHeight3, &texChannels3, STBI_rgb);
    if (!image) { return -1; }
    bool isGBR3 = false;
#endif

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

    // ?
	for (int x = 0; x < gridWidth; x++) {
		generateNewLineForeground(x);
	}

	for (int x = 0; x < gridWidth; x++) {
		generateNewLineBackground(x);
	}

	
	
    while (!glfwWindowShouldClose(window)) {
        glClear(GL_COLOR_BUFFER_BIT);
		
	
        
		if (1 == 1) {
			
			if(playerIsAlive) {
				score++;
				updateWorld();
				updatePlayer();
				//proofCollision();
			}
			
			drawWorld();
			drawPlayer();
			
			showText("SCORE", 5, 5, 9, 1);
			showNumber(score, 65, 5, 9, 1);

		} else {
			if (score != 0) {
				lastScore = score;
				if (lastScore > highScore) {
					highScore = score;
				}
			}
		
			score = 0;
			
			showText("SCORE", 50, 50, 14, 1);
			showNumber(lastScore, 250, 50, 14, 1);
			
			showText("HIGHSCORE", 50, 100, 14, 1);
			showNumber(highScore, 250, 100, 14, 1);
		}

		glfwSwapBuffers(window);
		
        glfwWaitEventsTimeout(0.0001);
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

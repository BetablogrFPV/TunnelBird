//--------------------------------------------------------------------------------------------// general libraries

#include "libraries/glfw-3.4.bin.WIN64/include/GLFW/glfw3.h"
#define GLFW_EXPOSE_NATIVE_WIN32
#include "libraries/glfw-3.4.bin.WIN64/include/GLFW/glfw3native.h"

#include <windows.h>

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <time.h>
#include <math.h>

#include <ctype.h>
#include <sys/stat.h>

//--------------------------------------------------------------------------------------------// own libraries

#include "modules/typedef_RGB_RGBA_color.h"
#include "modules/basic_font.h"
#include "modules/basic_shapes.h"
#include "modules/basic_graphics.h"
#include "modules/basic_gameFunctions.h"

//--------------------------------------------------------------------------------------------// graphic definitions

#define STB_IMAGE_IMPLEMENTATION
#include "libraries/stb_image.h"

RGBA COLOR_WHITE = {255, 255, 255, 255};
RGBA COLOR_RED = {255, 0, 0, 255};
RGBA COLOR_GREEN = {0, 255, 0, 255};
RGBA COLOR_BLUE = {0, 0, 255, 255};
RGBA COLOR_BLACK = {0, 0, 0, 255};


#define IDI_APP_ICON 101

#define TILESET_CHARACTER 12
#define TILESET_BLOCKS 13

GLuint spritesheet_character;
GLuint spritesheet_blocks;

//--------------------------------------------------------------------------------------------// game window variables

#define WINDOW_WIDTH 854  //<54
#define WINDOW_HEIGHT 480  //30
int REAL_WINDOW_WIDTH;
int REAL_WINDOW_HEIGHT;

int refreshRate;

bool gameIsRunning = false;

double updateFrameratePrint = 0.0;
double playerDeathTime = 0.0;

double lastUpdateTime = 0.0;

//--------------------------------------------------------------------------------------------// player variables

#define playerAccelerationFactor 0.009
float playerAcceleration = 0;
float playerPosY = WINDOW_HEIGHT / 2;
float playerPosX = 100;
bool playerIsAlive = true;
float gravity = -980.0f;

int currentPlayerSprite = 0;

int score = 0;
int highScore = 0;

//--------------------------------------------------------------------------------------------// map variables

#define gridWidth 56  //54
#define gridHeight 30  //30
#define gridLayers 3

int difficulty = 0;
float mapX = 0;
struct block* grid[gridLayers][gridWidth][gridHeight];

int directionSurface;
int directionRoof;

int surfaceBlockY;
int lastSurfaceBlockY;

int roofBlockY;
int lastRoofBlockY;

const int difficultyValues[3][10] = { {20, 20, 20, 16, 16, 16, 15, 15, 15, 14}, {19, 18, 17, 17, 16, 15, 14, 13, 12, 11}, {16, 15, 14, 13, 12, 12, 11, 10, 9, 8} };


struct block {
	char* block_name;
	bool block_visibilaty;
    GLuint block_image;
	unsigned char* block_hitmap;
};

struct block block_air;

struct block block_b1;
struct block block_b2;

struct block block_1111_f1;
struct block block_1111_f2;

struct block block_0111_f1;
struct block block_0111_f2;

struct block block_0011_f1;
struct block block_0011_f2;

struct block block_0110_f1;
struct block block_0110_f2;

struct block block_0010_f1;
struct block block_0010_f2;

struct block block_1101_f1;
struct block block_1101_f2;

struct block block_1001_f1;
struct block block_1001_f2;

struct block block_1100_f1;
struct block block_1100_f2;

struct block block_1000_f1;
struct block block_1000_f2;

struct block block_grass1_d1;
struct block block_grass1_d2;

struct block block_grass2_d1;
struct block block_grass2_d2;

struct block block_grass3_d1;
struct block block_grass3_d2;

struct block block_stone1_d1;
struct block block_stone1_d2;

struct block block_stone2_d1;
struct block block_stone2_d2;


//####################################################################################// general functions //####################################################################################//


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
	glOrtho(0, WINDOW_WIDTH, 0, WINDOW_HEIGHT, -1, 1);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
}



//####################################################################################// game functions //####################################################################################//


//--------------------------------------------------------------------------------------------// map functions background

struct block* getBackgroundBlock() {
	int randNum = (rand() % (100 - 0 + 1)) + 0;
	if (randNum > 50) { return &block_b1; }
	else { return &block_b2; }
}

void generateNewLineBackground(int linePosX) {
	for (int y = 0; y < gridHeight; y++) {
		grid[0][linePosX][y] = getBackgroundBlock();
	}
}

//--------------------------------------------------------------------------------------------// map functions foreground

struct block* getForegroundBlock(bool block_top, bool block_right, bool block_bottom, bool block_left) {

	int randNum = (rand() % (100 - 0 + 1)) + 0;

	int block = 0;
	if (block_top)    block |= 1 << 3; // Bit 3 = top
	if (block_right)  block |= 1 << 2; // Bit 2 = right
	if (block_bottom) block |= 1 << 1; // Bit 1 = bottom
	if (block_left)   block |= 1 << 0; // Bit 0 = left

	switch (block) {
	case 0b1111:
		if (randNum > 50) { return &block_1111_f1; }
		else { return &block_1111_f2; }
	case 0b0111:
		if (randNum > 50) { return &block_0111_f1; }
		else { return &block_0111_f2; }
	case 0b0011:
		if (randNum > 50) { return &block_0011_f1; }
		else { return &block_0011_f2; }
	case 0b0110:
		if (randNum > 50) { return &block_0110_f1; }
		else { return &block_0110_f2; }
	case 0b0010:
		if (randNum > 50) { return &block_0010_f1; }
		else { return &block_0010_f2; }
	case 0b1010:
		if (randNum > 50) { return &block_1111_f1; }
		else { return &block_1111_f2; }
	case 0b1011:
		if (randNum > 50) { return &block_1111_f1; }
		else { return &block_1111_f2; }
	case 0b1110:
		if (randNum > 50) { return &block_1111_f1; }
		else { return &block_1111_f2; }
	case 0b1101:
		if (randNum > 50) { return &block_1101_f1; }
		else { return &block_1101_f2; }
	case 0b1100:
		if (randNum > 50) { return &block_1100_f1; }
		else { return &block_1100_f2; }
	case 0b1001:
		if (randNum > 50) { return &block_1001_f1; }
		else { return &block_1001_f2; }
	case 0b1000:
		if (randNum > 50) { return &block_1000_f1; }
		else { return &block_1000_f2; }

	default:
		return &block_air;
	}
}

void generateNewLineForeground(int linePosX) {

	for (int y = 0; y < gridHeight; y++) {
		grid[1][linePosX][gridHeight - 1 - y] = &block_air;
	}

	if (linePosX == 0) {
		directionSurface = (rand() % 3) + 1;
		directionRoof = (rand() % 3) + 1;
		surfaceBlockY = gridHeight - 1 - ((rand() % (29 - 24 + 1)) + 24);
		roofBlockY = gridHeight - 1 - ((rand() % 5) + 0);
	}
	else {
		if ((rand() % 101) > 80) {
			directionSurface = (rand() % 3) + 1;
		}
		if ((gridHeight - 1 - lastSurfaceBlockY) < difficultyValues[0][difficulty]) {
			directionSurface = (rand() % 2) + 2;
		}
		if ((gridHeight - 1 - lastSurfaceBlockY) > 25) {
			directionSurface = (rand() % 2) + 1;
		}

		int lsb = gridHeight - 1 - lastSurfaceBlockY;
		if (lsb < 28) {
			if (directionSurface == 1) {
				surfaceBlockY = gridHeight - 1 - ((rand() % 3) + lsb - 2);
			}
			else if (directionSurface == 2) {
				surfaceBlockY = gridHeight - 1 - ((rand() % 3) + lsb - 1);
			}
			else if (directionSurface == 3) {
				surfaceBlockY = gridHeight - 1 - ((rand() % 3) + lsb + 0);
			}
		}
		else {
			surfaceBlockY = gridHeight - 1 - ((rand() % 3) + 27);
		}

		if ((rand() % 101) > 85) {
			directionRoof = (rand() % 3) + 1;
		}

		int diffSurfRoof = (gridHeight - 1 - surfaceBlockY) - (gridHeight - 1 - lastRoofBlockY);
		if (diffSurfRoof > difficultyValues[1][difficulty]) {
			directionRoof = (rand() % 2) + 2;
		}
		else if (diffSurfRoof > difficultyValues[2][difficulty]) {
			directionRoof = (rand() % 2) + 1;
		}
		else {
			directionRoof = 1;
		}

		if ((gridHeight - 1 - lastRoofBlockY) < 3) {
			directionRoof = (rand() % 2) + 2;
		}

		int lrb = gridHeight - 1 - lastRoofBlockY;
		if (lrb > 1) {
			if (directionRoof == 1) {
				roofBlockY = gridHeight - 1 - ((rand() % 2) + lrb - 2);
			}
			else if (directionRoof == 2) {
				roofBlockY = gridHeight - 1 - ((rand() % 3) + lrb - 1);
			}
			else if (directionRoof == 3) {
				roofBlockY = gridHeight - 1 - ((rand() % 4) + lrb + 0);
			}
		}
		else {
			roofBlockY = gridHeight - 1 - ((rand() % 3) + 0);
		}
	}

	for (int i = 0; i < gridHeight; i++) {
		int y = gridHeight - 1 - i;
		if (i <= (gridHeight - 1 - roofBlockY) || i >= (gridHeight - 1 - surfaceBlockY)) {
			grid[1][linePosX][y] = &block_1111_f1;
		}
	}

	if (linePosX != 0) {
		for (int i = 0; i < gridHeight; i++) {
			int y = gridHeight - 1 - i;
			bool right = grid[1][linePosX][y] != &block_air;
			bool left = grid[1][linePosX - 2][y] != &block_air;

			if (i < (gridHeight - 1 - lastRoofBlockY) || i > (gridHeight - 1 - lastSurfaceBlockY)) {
				grid[1][linePosX - 1][y] = getForegroundBlock(true, right, true, left);
			}
			if (i == (gridHeight - 1 - lastRoofBlockY)) {
				grid[1][linePosX - 1][y] = getForegroundBlock(true, right, false, left);
			}
			if (i == (gridHeight - 1 - lastSurfaceBlockY)) {
				grid[1][linePosX - 1][y] = getForegroundBlock(false, right, true, left);
			}
		}
	}

	lastSurfaceBlockY = surfaceBlockY;
	lastRoofBlockY = roofBlockY;
}

struct block* getPlant() {
	int randNum = (rand() % (14 - 0 + 1)) + 0;
	switch (randNum) {
	case 0:
		return &block_grass1_d1;
	case 1:
		return &block_grass1_d2;
	case 2:
		return &block_grass2_d1;
	case 3:
		return &block_grass2_d2;
	case 4:
		return &block_grass3_d1;
	case 5:
		return &block_grass3_d2;
	case 6:
		return &block_stone1_d1;
	case 7:
		return &block_stone1_d2;
	case 8:
		return &block_stone2_d1;
	case 9:
		return &block_stone2_d2;

	default:
		return &block_air;
	}
}

void setPlants(int linePosX) {
	for (int i = 0; i < gridHeight; i++) {
		grid[2][linePosX][i] = &block_air;

		if (grid[1][linePosX][i] == &block_0111_f1 || grid[1][linePosX][i] == &block_0111_f2) {

			grid[2][linePosX][i + 1] = getPlant();
			i += 1;
		}
	}
}


//--------------------------------------------------------------------------------------------// map functions general

void initBlocks() {
	block_air.block_image = 0;
	block_air.block_hitmap = getHitmap(16, 16, block_air.block_image);

    block_b1.block_image = extractTileFromTexture(spritesheet_blocks, 3, 1, 16);
	block_b2.block_image = extractTileFromTexture(spritesheet_blocks, 3, 3, 16);

	block_1111_f1.block_image = extractTileFromTexture(spritesheet_blocks, 1, 1, 16);
	block_1111_f1.block_hitmap = getHitmap(16, 16, block_1111_f1.block_image);
	block_1111_f2.block_image = extractTileFromTexture(spritesheet_blocks, 1, 3, 16);
	block_1111_f2.block_hitmap = getHitmap(16, 16, block_1111_f2.block_image);

	block_0111_f1.block_image = extractTileFromTexture(spritesheet_blocks, 5, 1, 16);
	block_0111_f1.block_hitmap = getHitmap(16, 16, block_0111_f1.block_image);
	block_0111_f2.block_image = extractTileFromTexture(spritesheet_blocks, 5, 3, 16);
	block_0111_f2.block_hitmap = getHitmap(16, 16, block_0111_f2.block_image);

	block_0011_f1.block_image = extractTileFromTexture(spritesheet_blocks, 9, 1, 16);
	block_0011_f1.block_hitmap = getHitmap(16, 16, block_0011_f1.block_image);
	block_0011_f2.block_image = extractTileFromTexture(spritesheet_blocks, 9, 3, 16);
	block_0011_f2.block_hitmap = getHitmap(16, 16, block_0011_f2.block_image);

	block_0110_f1.block_image = extractTileFromTexture(spritesheet_blocks, 7, 1, 16);
	block_0110_f1.block_hitmap = getHitmap(16, 16, block_0110_f1.block_image);
	block_0110_f2.block_image = extractTileFromTexture(spritesheet_blocks, 7, 3, 16);
	block_0110_f2.block_hitmap = getHitmap(16, 16, block_0110_f2.block_image);

	block_0010_f1.block_image = extractTileFromTexture(spritesheet_blocks, 11, 1, 16);
	block_0010_f1.block_hitmap = getHitmap(16, 16, block_0010_f1.block_image);
	block_0010_f2.block_image = extractTileFromTexture(spritesheet_blocks, 11, 3, 16);
	block_0010_f2.block_hitmap = getHitmap(16, 16, block_0010_f2.block_image);

	block_1101_f1.block_image = extractTileFromTexture(spritesheet_blocks, 13, 1, 16);
	block_1101_f1.block_hitmap = getHitmap(16, 16, block_1101_f1.block_image);
	block_1101_f2.block_image = extractTileFromTexture(spritesheet_blocks, 13, 3, 16);
	block_1101_f2.block_hitmap = getHitmap(16, 16, block_1101_f2.block_image);

	block_1001_f1.block_image = extractTileFromTexture(spritesheet_blocks, 17, 1, 16);
	block_1001_f1.block_hitmap = getHitmap(16, 16, block_1001_f1.block_image);
	block_1001_f2.block_image = extractTileFromTexture(spritesheet_blocks, 17, 3, 16);
	block_1001_f2.block_hitmap = getHitmap(16, 16, block_1001_f2.block_image);

	block_1100_f1.block_image = extractTileFromTexture(spritesheet_blocks, 15, 1, 16);
	block_1100_f1.block_hitmap = getHitmap(16, 16, block_1100_f1.block_image);
	block_1100_f2.block_image = extractTileFromTexture(spritesheet_blocks, 15, 3, 16);
	block_1100_f2.block_hitmap = getHitmap(16, 16, block_1100_f2.block_image);

	block_1000_f1.block_image = extractTileFromTexture(spritesheet_blocks, 19, 1, 16);
	block_1000_f1.block_hitmap = getHitmap(16, 16, block_1000_f1.block_image);
	block_1000_f2.block_image = extractTileFromTexture(spritesheet_blocks, 19, 3, 16);
	block_1000_f2.block_hitmap = getHitmap(16, 16, block_1000_f2.block_image);

	block_grass1_d1.block_image = extractTileFromTexture(spritesheet_blocks, 21, 1, 16);
	block_grass1_d2.block_image = extractTileFromTexture(spritesheet_blocks, 21, 3, 16);

	block_grass2_d1.block_image = extractTileFromTexture(spritesheet_blocks, 23, 1, 16);
	block_grass2_d2.block_image = extractTileFromTexture(spritesheet_blocks, 23, 3, 16);

	block_grass3_d1.block_image = extractTileFromTexture(spritesheet_blocks, 25, 1, 16);
	block_grass3_d2.block_image = extractTileFromTexture(spritesheet_blocks, 25, 3, 16);

	block_stone1_d1.block_image = extractTileFromTexture(spritesheet_blocks, 27, 1, 16);
	block_stone1_d2.block_image = extractTileFromTexture(spritesheet_blocks, 27, 3, 16);

	block_stone2_d1.block_image = extractTileFromTexture(spritesheet_blocks, 29, 1, 16);
	block_stone2_d2.block_image = extractTileFromTexture(spritesheet_blocks, 29, 3, 16);
}

void updateWorld() {
	if (mapX <= -16) {
		mapX = 0;

		for (int x = 1; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				grid[1][x - 1][y] = grid[1][x][y];
			}
		}

		for (int x = 1; x < gridWidth; x++) {
			for (int y = 0; y < gridHeight; y++) {
				grid[0][x - 1][y] = grid[0][x][y];
			}
		}

		for (int x = 1; x < gridWidth - 1; x++) {
			for (int y = 0; y < gridHeight; y++) {
				grid[2][x - 1][y] = grid[2][x][y];
			}
		}

		generateNewLineForeground(gridWidth - 1);
		generateNewLineBackground(gridWidth - 1);
		setPlants(gridWidth - 2);

		score++;

		if (score < 50) {
			difficulty = 0;
		}
		else if (score < 100) {
			difficulty = 1;
		}
		else if (score < 150) {
			difficulty = 2;
		}
		else if (score < 200) {
			difficulty = 3;
		}
		else if (score < 250) {
			difficulty = 4;
		}
		else if (score < 300) {
			difficulty = 5;
		}
		else if (score < 350) {
			difficulty = 6;
		}
		else if (score < 400) {
			difficulty = 7;
		}
		else if (score < 450) {
			difficulty = 8;
		}
		else if (score > 449) {
			difficulty = 9;
		}
	}
	float deltaTime = 1.0F / refreshRate;
	mapX -= 60 * deltaTime;
}

void drawWorld() {

	for (int x = 0; x < gridWidth; x++) {
		for (int y = 0; y < gridHeight; y++) {

			if (grid[1][x][y] != &block_1111_f1 && grid[1][x][y] != &block_1111_f2 && grid[0][x][y] != NULL) {
				drawFullTexture(grid[0][x][y] -> block_image, (x * 16) + mapX, (y * 16));
			}

			if (grid[1][x][y] != &block_air && grid[1][x][y] != NULL) {
				drawFullTexture(grid[1][x][y] -> block_image, (x * 16) + mapX, (y * 16));
			}

			if (grid[2][x][y] != &block_air && grid[2][x][y] != NULL) {
				drawFullTexture(grid[2][x][y] -> block_image, (x * 16) + mapX, (y * 16));
			}
		}
	}
}

//--------------------------------------------------------------------------------------------// proof player f_block collision

bool proofCollision(float playerPosX2, float playerPosY2) {
	int currentPlayerPointX0 = (int)floor((playerPosX2 - mapX) / 16);
	int currentPlayerPointY0 = (int)floor((playerPosY2) / 16);
	int currentPlayerPointX1 = currentPlayerPointX0 + 1;
	int currentPlayerPointY1 = currentPlayerPointY0 + 1;

	unsigned char* playerHitmap = getHitmap(16, 16, extractTileFromTexture(spritesheet_character, currentPlayerSprite, 0, 16));

	if (
		checkHitmapOverlap(grid[1][currentPlayerPointX0][currentPlayerPointY0]->block_hitmap, 16, 16, currentPlayerPointX0 * 16 + mapX, currentPlayerPointY0 * 16,
						   playerHitmap, 16, 16, (int)playerPosX2, (int)playerPosY2) ||
		checkHitmapOverlap(grid[1][currentPlayerPointX1][currentPlayerPointY0]->block_hitmap, 16, 16, currentPlayerPointX1 * 16 + mapX, currentPlayerPointY0 * 16,
						   playerHitmap, 16, 16, (int)playerPosX2, (int)playerPosY2) ||
		checkHitmapOverlap(grid[1][currentPlayerPointX1][currentPlayerPointY1]->block_hitmap, 16, 16, currentPlayerPointX1 * 16 + mapX, currentPlayerPointY1 * 16,
						   playerHitmap, 16, 16, (int)playerPosX2, (int)playerPosY2) ||
		checkHitmapOverlap(grid[1][currentPlayerPointX0][currentPlayerPointY1]->block_hitmap, 16, 16, currentPlayerPointX0 * 16 + mapX, currentPlayerPointY1 * 16,
						   playerHitmap, 16, 16, (int)playerPosX2, (int)playerPosY2)
	) {
		free(playerHitmap);
		return true;
	}

	free(playerHitmap);
	return false;
}

//--------------------------------------------------------------------------------------------// player functions

void updatePlayer() {

	if (playerIsAlive == true) {
		float deltaTime = 1.0f / (float)refreshRate;
		playerAcceleration += gravity * deltaTime;
		float movementHeight = playerAcceleration * deltaTime + 0.5f * gravity * deltaTime * deltaTime;

		if (proofCollision(playerPosX, playerPosY + movementHeight) == true) {
			for (int i = 0; i < fabs(movementHeight) + 1; i++) {
				playerPosY = floor(playerPosY);
				if (proofCollision(playerPosX, playerPosY + (movementHeight > 0 ? +1 : -1)) != true) {
					playerPosY += (movementHeight > 0 ? +1 : -1);
				}
				else {
					playerDeathTime = glfwGetTime();
					playerIsAlive = false;
					gameIsRunning = false;
					break;
				}
			}
		}
		else {
			playerPosY += movementHeight;
		}

	}
}

void drawPlayer() {
	drawTile(spritesheet_character, currentPlayerSprite, 0, 16, playerPosX, playerPosY, 16); //posx, posy, size, posX, posY, size
}

//--------------------------------------------------------------------------------------------// reset player and map

void resetGame() {
	playerAcceleration = 0;
	playerPosY = WINDOW_HEIGHT / 2;
	mapX = 0;
	difficulty = 0;
	playerIsAlive = true;

	int randNum = (rand() % (100 - 0 + 1)) + 0;

	if (randNum < 95) {
		currentPlayerSprite = 0;
	} else if (randNum < 100) {
		currentPlayerSprite = 1;
	} else {
		currentPlayerSprite = 2;
	}

	if (score > highScore) {
		highScore = score;
	}
	score = 0;

	for (int x = 0; x < gridWidth; x++) {
		generateNewLineBackground(x);
		generateNewLineForeground(x);
		if (x > 0) {
			setPlants(x - 1);
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
		}
		else if (gameIsRunning == false) {
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

	int displayRefreshRate = mode->refreshRate;

	glfwWindowHint(GLFW_REFRESH_RATE, refreshRate);

	bool refreshRateGot = true;

	window = glfwCreateWindow(REAL_WINDOW_WIDTH, REAL_WINDOW_HEIGHT, "tunnelBird", primaryMonitor, NULL);

	if (!window) { glfwTerminate(); return -1; }
	glfwMakeContextCurrent(window);

	glfwSwapInterval(1);

	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

	RGB transparentColor = { 255, 0, 255 };
	HINSTANCE hInstance = GetModuleHandle(NULL);

	spritesheet_character = loadTextureFromPNGResource(hInstance, TILESET_CHARACTER);
	spritesheet_blocks = loadTextureFromPNGResource(hInstance, TILESET_BLOCKS);

	glfwSetFramebufferSizeCallback(window, framebufferSizeCallback);
	glfwSetKeyCallback(window, keyCallback);
	glfwSetMouseButtonCallback(window, mouseButtonCallback);
	setWindowIcon(window);
	framebufferSizeCallback(window, REAL_WINDOW_WIDTH, REAL_WINDOW_HEIGHT);

	initBlocks(); // !WICHTIG!
	resetGame();
	
	float currentFramerate = 0.0;
	bool refreshRateTested = false;

	while (!glfwWindowShouldClose(window)) {

		double currentTime = glfwGetTime();
		if (currentTime - updateFrameratePrint >= 0.2) {
			currentFramerate = 1.0F / (currentTime - lastUpdateTime);
			updateFrameratePrint = currentTime;
		}
		lastUpdateTime = currentTime;

		if (!refreshRateTested) {
			if (currentFramerate - 5 > displayRefreshRate || currentFramerate + 5 < displayRefreshRate) {
				refreshRateGot = false;
			} else {
				refreshRate = displayRefreshRate;
			}
			refreshRateTested = true;
		}

		if (refreshRateGot != true) {
			refreshRate = (int) currentFramerate;
			drawString("CM", WINDOW_WIDTH - 90, WINDOW_HEIGHT - 14, 9, COLOR_RED);
		}

		glClear(GL_COLOR_BUFFER_BIT);

		drawWorld();
		drawPlayer();

		drawNumber((int)currentFramerate, WINDOW_WIDTH - 62, WINDOW_HEIGHT - 14, 9, COLOR_WHITE);
		drawString("FPS", WINDOW_WIDTH - 30, WINDOW_HEIGHT - 14, 9, COLOR_WHITE);

		if (gameIsRunning && playerIsAlive) {
			updateWorld();
			updatePlayer();

			drawString("SCORE", 5, WINDOW_HEIGHT - 14, 9, COLOR_WHITE);
			drawNumber(score, 65, WINDOW_HEIGHT - 14, 9, COLOR_WHITE);
			drawString("HIGHSCORE", 150, WINDOW_HEIGHT - 14, 9, COLOR_WHITE);
			drawNumber(highScore, 250,  WINDOW_HEIGHT - 14, 9, COLOR_WHITE);
		}
		else if (playerIsAlive) {
			drawString("SCORE", 5, WINDOW_HEIGHT - 14, 9, COLOR_WHITE);
			drawNumber(score, 65, WINDOW_HEIGHT - 14, 9, COLOR_WHITE);
			drawString("HIGHSCORE", 150, WINDOW_HEIGHT - 14, 9, COLOR_WHITE);
			drawNumber(highScore, 250,  WINDOW_HEIGHT - 14, 9, COLOR_WHITE);

			drawString("PRESS JUMP KEY TO START", (WINDOW_WIDTH / 2) - 115, 5, 10, COLOR_WHITE);
		}
		else {
			RGBA color = {50, 50, 50, 220 };
			drawRect((WINDOW_WIDTH / 2) - 100, 120, 200, 250, color);

			drawString("GAME OVER", (WINDOW_WIDTH / 2) - 90, 350, 11, COLOR_RED);

			if (score != 0 && score > highScore) {
				drawString("NEW HIGHSCORE", (WINDOW_WIDTH / 2) - 90, 310, 7, COLOR_GREEN);
				drawNumber(score, (WINDOW_WIDTH / 2) - 90, 290, 7, COLOR_GREEN);
			}
			else if (score != 0) {
				drawString("SCORE", (WINDOW_WIDTH / 2) - 90, 310, 7, COLOR_WHITE);
				drawNumber(score, (WINDOW_WIDTH / 2) - 90, 290, 7, COLOR_WHITE);

				drawString("HIGHSCORE", (WINDOW_WIDTH / 2) - 90, 250, 7, COLOR_WHITE);
				drawNumber(highScore, (WINDOW_WIDTH / 2) - 90, 230, 7, COLOR_WHITE);
			}

			drawString("PRESS JUMP KEY TO CONTINUE", (WINDOW_WIDTH / 2) - 90, 130, 7, COLOR_WHITE);
		}

		glfwSwapBuffers(window);

		glfwPollEvents();
	}

	glfwTerminate();

	glDeleteTextures(1, &spritesheet_character);
	glDeleteTextures(1, &spritesheet_blocks);

	return 0;
}
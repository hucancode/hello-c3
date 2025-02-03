module helloc3;
import std::io;
import raylib5::rl;

const int WIDTH = 1024;
const int HEIGHT = 768;

rl::Camera3D camera = {
	{10.0, 10.0, 10.0},
	{0.0, 0.0, 0.0},
	{0.0, 1.0, 0.0},
	45.0,
	rl::CameraProjection.PERSPECTIVE,
};

fn int main(String[] args) {
	init();
	defer deinit();
	while (!rl::windowShouldClose()) {
		update();
		draw();
	}
	return 0;
}

fn void init() {
	rl::initWindow(WIDTH, HEIGHT, "Hello C4!");
	rl::setTargetFPS(60);
}

fn void deinit() {
    rl::closeWindow();
}

fn void update() {
	rl::updateCamera(&camera, rl::CameraMode.ORBITAL);
}

fn void draw() {
	rl::beginDrawing();
	defer rl::endDrawing();
	rl::clearBackground(rl::RAYWHITE);
	rl::beginMode3D(camera);
	defer rl::endMode3D();
	rl::drawPlane({0.0, 0.0, 0.0}, {10.0, 10.0}, rl::LIGHTGRAY);
	rl::drawCube({0.0, 1.0, 0.0}, 2.0, 2.0, 2.0, rl::RED);
	rl::drawCubeWires({0.0, 1.0, 0.0}, 2.0, 2.0, 2.0, rl::DARKGRAY);
	rl::drawGrid(10, 1.0);
	rl::drawFPS(10, 10);
}

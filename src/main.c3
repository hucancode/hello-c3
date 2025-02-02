module helloc3;
import std::io;
import raylib5::rl;

const int WIDTH = 1024;
const int HEIGHT = 768;

const rl::Camera3D CAMERA = {
	rl::Vector3 {10.0, 10.0, 10.0},
	rl::Vector3 {0.0, 0.0, 0.0},
	rl::Vector3 {0.0, 1.0, 0.0},
	45.0,
	rl::CameraProjection.PERSPECTIVE,
};

fn int main(String[] args)
{
	io::printn("Hello, World!");
	defer rl::closeWindow();
	init();
	rl::setTargetFPS(60);
	while (!rl::windowShouldClose()) {
		update();
		draw();
	}
	return 0;
}

fn void init() {
	rl::initWindow(WIDTH, HEIGHT, "Hello C4!");
}

fn void update() {
	rl::updateCamera(&CAMERA, rl::CameraMode.ORBITAL);
}

fn void draw() {
	rl::beginDrawing();
	defer rl::endDrawing();
	rl::clearBackground(rl::RAYWHITE);
	rl::beginMode3D(CAMERA);
	defer rl::endMode3D();
	rl::drawPlane(rl::Vector3{0.0, 0.0, 0.0}, rl::Vector2{10.0, 10.0}, rl::LIGHTGRAY);
	rl::drawCube(rl::Vector3{0.0, 1.0, 0.0}, 2.0, 2.0, 2.0, rl::RED);
	rl::drawCubeWires(rl::Vector3{0.0, 1.0, 0.0}, 2.0, 2.0, 2.0, rl::DARKGRAY);
	rl::drawGrid(10, 1.0);
	rl::drawFPS(10, 10);
}

module helloc3;
import std::io;
import raylib;

const int WIDTH = 1024;
const int HEIGHT = 768;

const raylib::Camera3D camera = {
	raylib::Vector3 {10.0, 10.0, 10.0},
	raylib::Vector3 {0.0, 0.0, 0.0},
	raylib::Vector3 {0.0, 1.0, 0.0},
	45.0,
	raylib::CameraProjection.PERSPECTIVE,
};

fn int main(String[] args)
{
	io::printn("Hello, World!");
	defer raylib::CloseWindow();
	init();
	raylib::SetTargetFPS(60);
	while (!raylib::WindowShouldClose()) {
		update();
		draw();
	}
	return 0;
}

fn void init() {
	raylib::InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Hello C3!");
}

fn void update() {
	raylib::UpdateCamera(&camera, raylib::CameraMode.ORBITAL);
}

fn void draw() {
	raylib::BeginDrawing();
	defer raylib::EndDrawing();
	raylib::ClearBackground(raylib::RAYWHITE);
	raylib::BeginMode3D(camera);
	defer raylib::EndMode3D();
	raylib::DrawPlane(raylib::Vector3{0.0, 0.0, 0.0}, raylib::Vector2{10.0, 10.0}, raylib::LIGHTGRAY);
	raylib::DrawCube(raylib::Vector3{0.0, 1.0, 0.0}, 2.0, 2.0, 2.0, raylib::RED);
	raylib::DrawCubeWires(raylib::Vector3{0.0, 1.0, 0.0}, 2.0, 2.0, 2.0, raylib::DARKGRAY);
	raylib::DrawGrid(10, 1.0);
	raylib::DrawFPS(10, 10);
}

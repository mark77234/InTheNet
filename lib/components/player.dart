import 'package:flame_forge2d/flame_forge2d.dart';

class Player extends BodyComponent  {
  final double moveSpeed = 100000;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final playerShape = CircleShape();
    playerShape.radius = 15.0;

    final fixtureDef = FixtureDef(playerShape);
    body = world.createBody(BodyDef()
      ..type = BodyType.dynamic
      ..position = Vector2(250, 500)); // 초기 위치 설정

    body.createFixture(fixtureDef);
  }

  void moveLeft() {
    body.applyLinearImpulse(Vector2(-moveSpeed, 0), point: body.worldCenter, wake: true);
  }

  // 오른쪽으로 이동하는 메서드
  void moveRight() {
    body.applyLinearImpulse(Vector2(moveSpeed, 0), point: body.worldCenter, wake: true);
  }

  // 위로 이동하는 메서드
  void moveUp() {
    body.applyLinearImpulse(Vector2(0, -moveSpeed), point: body.worldCenter, wake: true);
  }

  // 아래로 이동하는 메서드
  void moveDown() {
    body.applyLinearImpulse(Vector2(0, moveSpeed), point: body.worldCenter, wake: true);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // 플레이어 움직임 로직 (예: 키보드 입력 또는 터치 입력)
  }
}
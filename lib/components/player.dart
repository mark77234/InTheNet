import 'package:flame_forge2d/flame_forge2d.dart';

class Player extends BodyComponent {
  final double moveSpeed = 1000000;
  final double dampingFactor = 0.98;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final playerShape = CircleShape();
    playerShape.radius = 15.0;

    final fixtureDef = FixtureDef(playerShape);
    body = world.createBody(BodyDef()
      ..type = BodyType.dynamic
      ..position = Vector2(250, 500))
      ..linearDamping = 0.0 // 선형 감쇠를 0으로 설정하여 속도가 줄어들지 않게 함
      ..angularDamping = 0.0;

    body.createFixture(fixtureDef);
    // 경계 설정 (화면 크기 기준으로)
    final screenSize = Vector2(500, 815); // 화면 크기 (필요에 맞게 변경)

    // 왼쪽 경계 (X=0, Y=0에서 Y=600까지)
    _createBoundary(Vector2(0, 0), Vector2(0, screenSize.y));

    // 오른쪽 경계 (X=500, Y=0에서 X=500, Y=600까지)
    _createBoundary(Vector2(screenSize.x - 15, 0),
        Vector2(screenSize.x - 15, screenSize.y));

    // 위쪽 경계 (X=0, Y=0에서 X=500, Y=0까지)
    _createBoundary(Vector2(0, 50), Vector2(screenSize.x, 50));

    // 아래쪽 경계 (X=0, Y=600에서 X=500, Y=600까지)
    _createBoundary(
        Vector2(0, screenSize.y), Vector2(screenSize.x, screenSize.y));
  }

  void moveLeft() {
    body.linearVelocity = Vector2(-moveSpeed, body.linearVelocity.y);
  }

  void moveRight() {
    body.linearVelocity = Vector2(moveSpeed, body.linearVelocity.y);
  }

  void moveUp() {
    body.linearVelocity = Vector2(body.linearVelocity.x, -moveSpeed);
  }

  void moveDown() {
    body.linearVelocity = Vector2(body.linearVelocity.x, moveSpeed);
  }

  void _createBoundary(Vector2 start, Vector2 end) {
    final edgeShape = EdgeShape();
    edgeShape.set(start, end);

    final boundaryFixture = FixtureDef(edgeShape);
    world
        .createBody(BodyDef()..type = BodyType.static)
        .createFixture(boundaryFixture);
  }

  @override
  void update(double dt) {
    super.update(dt);

    body.linearVelocity = body.linearVelocity * dampingFactor; // 속도를 감소시킴
  }
}

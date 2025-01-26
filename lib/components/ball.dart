import 'package:flame_forge2d/flame_forge2d.dart';

class Ball extends BodyComponent {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final ballShape = CircleShape();
    ballShape.radius = 5.0; // 공의 크기 설정

    final fixtureDef = FixtureDef(ballShape);
    body = world.createBody(BodyDef()
      ..type = BodyType.dynamic
      ..position = Vector2(250, 400));

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

  // 경계 바디 생성
  void _createBoundary(Vector2 start, Vector2 end) {
    final edgeShape = EdgeShape();
    edgeShape.set(start, end);

    final boundaryFixture = FixtureDef(edgeShape);
    world.createBody(BodyDef()..type = BodyType.static)
      ..createFixture(boundaryFixture);
  }
}

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
  }
}
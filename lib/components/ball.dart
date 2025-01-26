import 'package:flame_forge2d/flame_forge2d.dart';

class Ball extends BodyComponent {
  final double dampingFactor = 0.99; // 속도를 줄이는 계수

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final ballShape = CircleShape();
    ballShape.radius = 5.0; // 공의 크기 설정

    final fixtureDef = FixtureDef(ballShape)..restitution = 1;

    body = world.createBody(BodyDef()
      ..type = BodyType.dynamic
      ..position = Vector2(250, 400));

    body.createFixture(fixtureDef);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // 속도 감소: 공의 속도를 계속해서 줄여줍니다.
    body.linearVelocity *= dampingFactor;
  }
}

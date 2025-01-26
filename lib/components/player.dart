import 'package:flame_forge2d/flame_forge2d.dart';

class Player extends BodyComponent  {
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

  @override
  void update(double dt) {
    super.update(dt);
    // 플레이어 움직임 로직 (예: 키보드 입력 또는 터치 입력)
  }
}
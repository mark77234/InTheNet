import 'package:flame_forge2d/flame_forge2d.dart';

class Goal extends BodyComponent{
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final goalShape = PolygonShape();

    goalShape.setAsBox(
        50, 5, Vector2(0.0, 0.0), 0.0);
    final fixtureDef = FixtureDef(goalShape);

    body = world.createBody(BodyDef()
      ..type = BodyType.static
      ..position = Vector2(250, 100));

    body.createFixture(fixtureDef);
  }
}

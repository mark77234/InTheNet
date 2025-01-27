import 'package:flame_forge2d/flame_forge2d.dart';

class Net extends BodyComponent {
  Net({
    required Vector2 position,
    required Vector2 size,
  }) : super(
    bodyDef: BodyDef(type: BodyType.static, position: position),
    fixtureDefs: [
      FixtureDef(
        PolygonShape()..setAsBoxXY(size.x * 0.5, size.y * 0.5),
        restitution: 1,
      ),
    ],
  ){
    bodyDef?.userData = this;
  }
}
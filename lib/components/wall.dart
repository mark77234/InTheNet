import 'package:flame_forge2d/flame_forge2d.dart';

class Walls extends BodyComponent {
  Walls(Vector2 gameSize, double wallThickness)
      : super(
          bodyDef: BodyDef(type: BodyType.static),
          fixtureDefs: [
            FixtureDef(
              PolygonShape()
                ..setAsBox(
                  gameSize.x * 0.5,
                  wallThickness * 0.5,
                  Vector2(gameSize.x * 0.5, wallThickness * 0.5),
                  0,
                ),
              isSensor: true,
            ),
            FixtureDef(
              PolygonShape()
                ..setAsBox(
                  wallThickness * 0.5,
                  gameSize.y * 0.5,
                  Vector2(wallThickness * 0.5, gameSize.y * 0.5),
                  0,
                ),
              restitution: 1,
            ),
            FixtureDef(
              PolygonShape()
                ..setAsBox(
                  wallThickness * 0.5,
                  gameSize.y * 0.5,
                  Vector2(gameSize.x - wallThickness * 0.5, gameSize.y * 0.5),
                  0,
                ),
              restitution: 1,
            ),
            FixtureDef(
              PolygonShape()
                ..setAsBox(
                  gameSize.x * 0.5,
                  wallThickness * 0.5,
                  Vector2(gameSize.x * 0.5, gameSize.y - wallThickness * 0.5),
                  0,
                ),
              restitution: 1,
            ),
          ],
        ){
    bodyDef?.userData = this;
  }
}

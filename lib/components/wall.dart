import 'package:flame_forge2d/flame_forge2d.dart';

class Walls extends BodyComponent {
  Walls(Vector2 gameSize, double wallThickness)
      : super(
          bodyDef: BodyDef(type: BodyType.static),
          fixtureDefs: [
            // 위쪽 벽 (충돌)
            FixtureDef(
              PolygonShape()
                ..setAsBox(
                  gameSize.x * 0.5,
                  wallThickness * 0.1,
                  Vector2(gameSize.x * 0.5, wallThickness * 0.1),
                  0,
                ),
              restitution: 1, // 반발력
            ),
            // 위쪽 벽 (센서)
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
            // 왼쪽 벽
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
            // 오른쪽 벽
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
            // 아래쪽 벽 (센서)
            FixtureDef(
              PolygonShape()
                ..setAsBox(
                  gameSize.x * 0.5,
                  wallThickness * 0.5,
                  Vector2(gameSize.x * 0.5, gameSize.y - wallThickness * 0.5),
                  0,
                ),
              isSensor: true,
            ),
            // 아래쪽 벽 (충돌)
            FixtureDef(
              PolygonShape()
                ..setAsBox(
                  gameSize.x * 0.5,
                  wallThickness * 0.1,
                  Vector2(gameSize.x * 0.5, gameSize.y - wallThickness * 0.1),
                  0,
                ),
              restitution: 1,
            ),
          ],
        ){
    bodyDef?.userData = this;
  }
}

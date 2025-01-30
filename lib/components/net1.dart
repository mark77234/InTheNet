import 'package:flame_forge2d/flame_forge2d.dart';

import 'package:flutter/material.dart';

class Net1 extends BodyComponent {
  Net1({
    required Vector2 position,
    required Vector2 size,
    this.color = const Color(0xFF4A68BE),
  }) : super(
    bodyDef: BodyDef(type: BodyType.static, position: position),
    fixtureDefs: [
      FixtureDef(
        PolygonShape()..setAsBoxXY((size.x - size.y) * 0.5, size.y * 0.5),
      ),
      FixtureDef(
        CircleShape()
          ..radius = size.y * 0.5
          ..position.setValues(-size.x * 0.5 + size.y * 0.5, 0),
      ),
      FixtureDef(
        CircleShape()
          ..radius = size.y * 0.5
          ..position.setValues(size.x * 0.5 - size.y * 0.5, 0),
      ),
    ],
  ){
    bodyDef?.userData = this;
  }
  final Color color;

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final paint = Paint()..color = color;

    // 사각형 부분 렌더링
    final rectWidth = (body.fixtures[0].shape as PolygonShape).vertices[1].x * 2;
    final rectHeight = (body.fixtures[0].shape as PolygonShape).vertices[2].y * 2;
    final rect = Rect.fromCenter(
      center: Offset.zero,
      width: rectWidth,
      height: rectHeight,
    );
    canvas.drawRect(rect, paint);

    // 왼쪽 원 렌더링
    final leftCircle = body.fixtures[1].shape as CircleShape;
    final leftOffset = Offset(leftCircle.position.x, leftCircle.position.y);
    canvas.drawCircle(leftOffset, leftCircle.radius, paint);

    // 오른쪽 원 렌더링
    final rightCircle = body.fixtures[2].shape as CircleShape;
    final rightOffset = Offset(rightCircle.position.x, rightCircle.position.y);
    canvas.drawCircle(rightOffset, rightCircle.radius, paint);
  }
}
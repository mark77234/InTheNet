import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class Player extends BodyComponent with KeyboardHandler {
  Player({
    required this.size,
    Vector2? position,
    required this.color,
  }) : super(
      bodyDef: BodyDef(
        type: BodyType.dynamic,
        position: position,
        allowSleep: false,
      ),
      fixtureDefs: [
        FixtureDef(
          CircleShape()..radius = size.x * 0.3,
          restitution: 0.2,
        ),
      ]) {
    bodyDef?.userData = this;
  }

  final Color color;
  final Vector2 size;

  double _hAxis = 0;
  double _vAxis = 0;

  final double _maxSpeed = 150;
  final double _friction = 0.95;

  bool get _isAtLimits =>
      (position.x < size.x * 0.55 && _hAxis < 0) || // 왼쪽 제한
          (position.x > game.camera.viewport.virtualSize.x - size.x * 0.55 &&
              _hAxis > 0) || // 오른쪽 제한
          (position.y < size.y * 2.6 && _vAxis < 0) || // 위쪽 제한
          (position.y > game.camera.viewport.virtualSize.y - size.y * 2.6 &&
              _vAxis > 0); // 아래쪽 제한

  @override
  void update(double dt) {
    if (!_isAtLimits) {
      body.applyForce(Vector2(_hAxis * _maxSpeed, _vAxis * _maxSpeed));
    }
    body.linearVelocity *= _friction;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final paint = Paint()..color = color;
    canvas.drawCircle(Offset.zero, body.fixtures[0].shape.radius, paint);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed);

  // hAxis, vAxis getter / setter 추가
  set hAxis(double value) {
    _hAxis = value;
  }

  set vAxis(double value) {
    _vAxis = value;
  }

  double get hAxis => _hAxis;
  double get vAxis => _vAxis;
}
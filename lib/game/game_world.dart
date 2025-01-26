import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:inthenet/components/background.dart';
import 'package:inthenet/components/player.dart';
import 'package:inthenet/components/ball.dart';
import 'package:inthenet/components/goal.dart';

class GameWorld extends Forge2DGame with KeyboardEvents {  // KeyboardEvents mixin 추가
  final Player _player = Player();
  final Ball ball = Ball();
  final Goal goal = Goal();

  final Set<LogicalKeyboardKey> _keysPressed = {};

  @override
  Future<void> onLoad() async {
    world.gravity = Vector2(0, 0);
    final background = MainBackground();
    await add(background);

    await add(_player);
    await add(ball);
    await add(goal);

    super.onLoad();
  }

  @override
  KeyEventResult onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    super.onKeyEvent(event, keysPressed);

    if (event is KeyDownEvent) {
      _keysPressed.add(event.logicalKey); // 눌린 키를 추적
    } else if (event is KeyUpEvent) {
      _keysPressed.remove(event.logicalKey); // 떼어진 키를 추적
    }

    return KeyEventResult.handled; // 키 입력을 처리했음을 나타내는 반환값
  }

  @override
  void update(double dt) {
    super.update(dt);

    // 지속적으로 키가 눌려있는 동안 이동 처리
    if (_keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      _player.moveUp();
    }
    if (_keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      _player.moveDown();
    }
    if (_keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      _player.moveLeft();
    }
    if (_keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      _player.moveRight();
    }
  }
}
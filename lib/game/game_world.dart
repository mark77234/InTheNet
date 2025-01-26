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
      print('키 아래 눌림: ${event.logicalKey}');  // 눌린 키를 로그로 출력

      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        _player.moveUp();
        print('왼쪽 화살표 키 눌렀음: 위쪽 이동');
      } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        print('왼쪽 화살표 키 눌렀음: 아래쪽 이동');
        _player.moveDown();
      }
      else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        print('왼쪽 화살표 키 눌렀음: 왼쪽 이동');
        _player.moveLeft();
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        print('오른쪽 화살표 키 눌렀음: 오른쪽 이동');
        _player.moveRight();
      }
    }

    return KeyEventResult.handled; // 키 입력을 처리했음을 나타내는 반환값
  }
}
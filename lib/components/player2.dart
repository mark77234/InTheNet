import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'player.dart';

class Player2 extends Player {
  Player2({
    required Vector2 size,
    Vector2? position,
  }) : super(
    size: size,
    position: position,
    color: const Color(0xFFA55453),
  );
  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    hAxis = 0; // 수평 방향 초기화
    vAxis = 0; // 수직 방향 초기화

    // 수평 입력 처리 (화살표 키)
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      hAxis -= 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      hAxis += 1;
    }

    // 수직 입력 처리 (화살표 키)
    if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      vAxis -= 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      vAxis += 1;
    }

    return super.onKeyEvent(event, keysPressed);
  }
}
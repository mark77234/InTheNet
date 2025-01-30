import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'player.dart';

class Player1 extends Player {
  Player1({
    required Vector2 size,
    Vector2? position,
  }) : super(
    size: size,
    position: position,
    color: const Color(0xFF4A68BE),
  );
  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    hAxis = 0; // 수평 방향 초기화
    vAxis = 0; // 수직 방향 초기화

    // 수평 입력 처리 (WASD)
    if (keysPressed.contains(LogicalKeyboardKey.keyA)) {
      hAxis -= 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyD)) {
      hAxis += 1;
    }

    // 수직 입력 처리 (WASD)
    if (keysPressed.contains(LogicalKeyboardKey.keyW)) {
      vAxis -= 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyS)) {
      vAxis += 1;
    }

    return super.onKeyEvent(event, keysPressed);
  }
}
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:inthenet/components/background.dart';

import 'package:inthenet/components/net2_zone.dart';
import 'package:inthenet/game/game.dart';
import 'package:inthenet/components/player1.dart';
import 'package:inthenet/components/wall.dart';
import 'package:inthenet/components/ball.dart';

import '../components/net1_zone.dart';
import '../components/player2.dart';

class InTheNetWorld extends Forge2DWorld with HasGameReference<InTheNetGame> {
  InTheNetWorld() : super(gravity: Vector2.zero());
  bool isGameOver = false;
  String winner = '';
  int player1Score = 0;
  int player2Score = 0;

  final background = MainBackground();

  static const double gameOverTextSize = 1.0;
  static const double scoreTextSize = 2.0;
  static const double textSpacing = 0.1; // 텍스트 간격 비율

  @override
  Future<void> onLoad() async {
    await _start();
  }

  // 게임 오버 후 처리 로직
  void reset(String Winner) {
    isGameOver = true;
    winner = Winner;
    if (winner == 'Player1') {
      player1Score++;
    } else if (winner == 'Player2') {
      player2Score++;
    }

    // 게임 오버 텍스트와 점수 텍스트 추가
    final gameOverText = _buildTextComponent(
      "$winner Wins!",
      Vector2(0.5 * game.camera.viewport.virtualSize.x,
          0.5 * game.camera.viewport.virtualSize.y),
      gameOverTextSize,
    );
    final score = _buildTextComponent(
      "$player1Score - $player2Score",
      Vector2(0.5 * game.camera.viewport.virtualSize.x,
          0.4 * game.camera.viewport.virtualSize.y),
      scoreTextSize,
    );

    add(score);
    add(gameOverText);

    // 2초 뒤에 게임을 리셋하고, 게임 오버 텍스트를 제거합니다.
    Future.delayed(const Duration(seconds: 2), () {
      remove(gameOverText);
      removeAll(children);
      isGameOver = false;
      _start();
    });
  }

  // 텍스트 컴포넌트 생성 함수
  TextComponent _buildTextComponent(String text, Vector2 position, double fontSize) {
    return TextComponent(
      text: text,
      position: position,
    )
      ..anchor = Anchor.center  // 텍스트의 중심을 기준으로 배치
      ..textRenderer = TextPaint(
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
  }

  // 게임 초기화 함수
  Future<void> _start() async {
    await add(background);

    // 벽과 공, 플레이어, 네트 존 컴포넌트 추가
    await Future.wait([
      _addWalls(),
      _addBall(),
      _addPlayers(),
      _addNetZones(),
    ]);
  }

  // 벽 추가 함수
  Future<void> _addWalls() async {
    await add(
      Walls(
        game.camera.viewport.virtualSize,
        5 * InTheNetGame.lengthFactor,
      ),
    );
  }

  // 공 추가 함수
  Future<void> _addBall() async {
    await add(
      Ball(
        radius: 4 * InTheNetGame.lengthFactor,
        position: Vector2(game.camera.viewport.virtualSize.x * 0.5,
            game.camera.viewport.virtualSize.y * 0.5), // 세로 하단, 가로 중앙
      ),
    );
  }

  // 플레이어 추가 함수
  Future<void> _addPlayers() async {
    await add(
      Player1(
        size: Vector2(30, 6)..scale(InTheNetGame.lengthFactor),
        position: Vector2(
          0.5 * game.camera.viewport.virtualSize.x,
          0.8 * game.camera.viewport.virtualSize.y,
        ),
      ),
    );
    await add(
      Player2(
        size: Vector2(30, 6)..scale(InTheNetGame.lengthFactor),
        position: Vector2(
          0.5 * game.camera.viewport.virtualSize.x,
          0.2 * game.camera.viewport.virtualSize.y,
        ),
      ),
    );
  }

  // 네트존 추가 함수
  Future<void> _addNetZones() async {
    await Future.wait([
      _addNetZone1(),
      _addNetZone2(),
    ]);
  }

  // Net1Zone 추가 함수
  Future<void> _addNetZone1() async {
    await add(
      Net1Zone(
        size: Vector2(
          game.camera.viewport.virtualSize.x * 0.8,
          game.camera.viewport.virtualSize.y * 0.35,
        ),
        position: Vector2(
          game.camera.viewport.virtualSize.x * 0.1,
          game.camera.viewport.virtualSize.y * 0.25,
        ),
        numBricksX: 1,
        numBricksY: 1,
        spacingX: 5 * InTheNetGame.lengthFactor,
        spacingY: 5 * InTheNetGame.lengthFactor,
      ),
    );
  }

  // Net2Zone 추가 함수
  Future<void> _addNetZone2() async {
    await add(
      Net2Zone(
        size: Vector2(
          game.camera.viewport.virtualSize.x * 0.8,
          game.camera.viewport.virtualSize.y * 0.35,
        ),
        position: Vector2(
          game.camera.viewport.virtualSize.x * 0.1,
          game.camera.viewport.virtualSize.y * 0.1,
        ),
        numBricksX: 1,
        numBricksY: 1,
        spacingX: 5 * InTheNetGame.lengthFactor,
        spacingY: 5 * InTheNetGame.lengthFactor,
      ),
    );
  }
}
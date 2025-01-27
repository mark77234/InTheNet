import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import 'package:inthenet/components/background.dart';

import 'package:inthenet/components/net_zone.dart';
import 'package:inthenet/game/game.dart';
import 'package:inthenet/components/player.dart';
import 'package:inthenet/components/wall.dart';
import 'package:inthenet/components/ball.dart';

class InTheNetWorld extends Forge2DWorld with HasGameReference<InTheNetGame> {
  InTheNetWorld() : super(gravity: Vector2.zero());

  final background = MainBackground();

  @override
  Future<void> onLoad() async {
    await _start();
  }

  void reset() {
    removeAll(children);
    Future.delayed(const Duration(seconds: 1), () => _start());
  }

  Future<void> _start() async {
    await add(background);
    await add(
      Walls(
        game.camera.viewport.virtualSize,
        5 * InTheNetGame.lengthFactor,
      ),
    );
    await add(
      Ball(
        radius: 4 * InTheNetGame.lengthFactor,
        position: Vector2(game.camera.viewport.virtualSize.x * 0.5,
            game.camera.viewport.virtualSize.y - 7), // 세로 하단, 가로 중앙
      ),
    );
    await add(
      Player(
        size: Vector2(30, 6)..scale(InTheNetGame.lengthFactor),
        position: Vector2(
          0.5 * game.camera.viewport.virtualSize.x,
          0.9 * game.camera.viewport.virtualSize.y,
        ),
      ),
    );
    await add(
      NetZone(
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

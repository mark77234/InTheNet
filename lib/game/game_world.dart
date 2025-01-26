import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:inthenet/components/background.dart';

import 'package:inthenet/components/player.dart';
import 'package:inthenet/components/ball.dart';
import 'package:inthenet/components/goal.dart';

class GameWorld extends Forge2DGame {
  final Player _player = Player();
  final Ball ball = Ball();
  final Goal goal = Goal();

  @override
  Future<void> onLoad() async {

    final background = MainBackground();
    await add(background);

    await add(_player);
    await add(ball);
    await add(goal);

    super.onLoad();
  }
}

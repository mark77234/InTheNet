import 'package:flame/game.dart';
import 'package:inthenet/game/game_world.dart';

class StartGame extends FlameGame {
  late GameWorld _gameWorld;

  @override
  Future<void> onLoad() async {
    // GameWorld 인스턴스를 생성 후 추가
    _gameWorld = GameWorld();
    await _gameWorld.onLoad();
    add(_gameWorld);

    super.onLoad();
  }
}
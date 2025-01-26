import 'package:flame/components.dart';

class MainBackground extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('main_background.png');
    size = Vector2(gameRef.size.x, gameRef.size.y);

  }
}

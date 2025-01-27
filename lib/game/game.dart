import 'package:flame/camera.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:inthenet/game/world.dart';

class InTheNetGame extends Forge2DGame<InTheNetWorld> with HasKeyboardHandlerComponents {
  InTheNetGame()
      : super(
          world: InTheNetWorld(),
          camera: CameraComponent.withFixedResolution(
              width: 180 * lengthFactor, height: 320 * lengthFactor),
        );

  static const lengthFactor = 0.1;

  @override
  void onLoad() {
    camera.viewfinder.zoom = 1.0;
    camera.moveTo(camera.viewport.virtualSize * 0.5);
  }
}

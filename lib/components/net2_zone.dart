import 'package:inthenet/components/net2.dart';
import 'package:flame/components.dart';

class Net2Zone extends PositionComponent {
  Net2Zone({
    required super.position,
    required super.size,
    required this.numBricksX,
    required this.numBricksY,
    required this.spacingX,
    required this.spacingY,
  }) {
    brickSize = Vector2(
      3,0.5
    );
  }

  final int numBricksX;
  final int numBricksY;
  final double spacingX;
  final double spacingY;
  late final Vector2 brickSize;

  @override
  void onMount() {
    super.onMount();

    final startX = position.x + size.x  / 2;
    final startY = position.y / 2;

    final brickPosition = Vector2(startX, startY);
    final brick = Net2(position: brickPosition, size: brickSize);
    parent?.add(brick);
  }
}
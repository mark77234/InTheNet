import 'package:inthenet/components/net1.dart';
import 'package:flame/components.dart';

class Net1Zone extends PositionComponent {
  Net1Zone({
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

    final startX = position.x + size.x / 2;
    final startY = position.y + size.y * 2;

    final brickPosition = Vector2(startX, startY);
    final brick = Net1(position: brickPosition, size: brickSize);
    parent?.add(brick);
  }
}
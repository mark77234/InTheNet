import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:inthenet/components/player1.dart';
import 'package:inthenet/components/player2.dart';
import 'package:inthenet/components/wall.dart';
import 'package:inthenet/game/world.dart';

import 'package:inthenet/components/player.dart';
import 'package:inthenet/components/net2.dart';
import 'package:inthenet/components/net1.dart';

class Ball extends BodyComponent
    with ContactCallbacks, ParentIsA<InTheNetWorld> {

  Ball({
    double radius = 0,
    Vector2? position,
  }) : super(
          bodyDef: BodyDef(
            type: BodyType.dynamic,
            position: position,
            fixedRotation: true,
            bullet: true,
          ),
          fixtureDefs: [
            FixtureDef(
              CircleShape()..radius = radius,
              restitution: 1,
            ),
          ],
        ) {
    bodyDef?.userData = this;
  }

  Player? lastPlayer;

  @override
  void beginContact(Object other, Contact contact) {

    if (parent.isGameOver) {
      return;
    }

    if (other is Net1) {
      // Net1에 닿으면 Player2 승리
      other.removeFromParent();
      parent.reset('Player2');
    } else if (other is Net2) {
      // Net2에 닿으면 Player1 승리
      other.removeFromParent();
      parent.reset('Player1');
    } else if (other is Walls &&
        (contact.fixtureA.isSensor || contact.fixtureB.isSensor)) {
      // 벽에 닿으면, 마지막 플레이어가 벽에 맞았을 때
      print('${lastPlayer.runtimeType}가 공을 건드린 후 벽에 맞았습니다!');
      // 벽에 닿았을 때 패자는 마지막 플레이어
      parent.reset(lastPlayer is Player1 ? 'Player2' : 'Player1');
    } else if (other is Player1) {
      // Player1이 공을 건드린 경우
      lastPlayer = other;
    } else if (other is Player2) {
      // Player2가 공을 건드린 경우
      lastPlayer = other;
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    body.applyLinearImpulse(Vector2(0, 0));
  }

  @override
  void update(double dt) {
    body.linearVelocity *= 0.99;
  }
}

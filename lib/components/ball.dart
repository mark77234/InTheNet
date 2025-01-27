import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:inthenet/components/wall.dart';
import 'package:inthenet/game/world.dart';

import 'package:inthenet/components/net.dart';

class Ball extends BodyComponent with ContactCallbacks, ParentIsA<InTheNetWorld> {
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
  ){
    bodyDef?.userData = this;
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Net) {
      other.removeFromParent();
    } else if (other is Walls &&
        (contact.fixtureA.isSensor || contact.fixtureB.isSensor)) {
      parent.reset();
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    body.applyLinearImpulse(Vector2(0,0));
  }

  @override
  void update(double dt) {
    body.linearVelocity *= 0.99;
  }

}
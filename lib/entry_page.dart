import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:inthenet/game/game.dart';
// import 'package:inthenet/game/world.dart';
// import 'package:inthenet/game/game_world.dart';

// import 'package:inthenet/game/game_world.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget.controlled(gameFactory: InTheNetGame.new,),
    );
  }
}
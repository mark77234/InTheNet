import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:inthenet/game/game_world.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Soccer Game"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GameWidget(
            game: GameWorld(), // 이부분에 게임 인스턴스를 넣어준다.
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../screens/screen_game.dart';

class HangmanGameApp extends StatelessWidget {
  const HangmanGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hangman Game',
      home: ScreenGame(),
    );
  }
}

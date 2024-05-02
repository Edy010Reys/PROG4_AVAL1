import 'package:flutter/material.dart';

import 'package:restart_app/restart_app.dart';

import 'package:flutter_exit_app/flutter_exit_app.dart';

class ScreenRestart extends StatelessWidget {
  const ScreenRestart({
    super.key,
    required this.message,
    this.wordCorrect,
  });

  final String message;
  final String? wordCorrect;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: Column(
          children: [
            Text(message),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(wordCorrect ?? ''),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Você quer reiniciar a partida ou sair do App?',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => Restart.restartApp(),
                      child: const Text(
                        'Reiniciar a partida',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    TextButton(
                      onPressed: () => FlutterExitApp.exitApp(),
                      child: const Text(
                        'Sair do app',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

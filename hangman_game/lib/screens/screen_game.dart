import 'package:flutter/material.dart';

import '../utilities/word_secret.dart';

import 'screen_restart.dart';

import '../utilities/words_and_tips.dart';

import 'dart:math';

final List<String> alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

final _wordsAndTips = WordsAndTips();

final _rnd = Random().nextInt(_wordsAndTips.wordsAndTips.length);

final String _wordChosen = _wordsAndTips.wordsAndTips.keys.toList()[_rnd];

List<String> _lettersErrors = [];

List<String> _lettersHits = [];

int _pointsHits = 0;

int _pointsErrors = 0;

String _tip = '';

String _result = '';

AssetImage _imageHangman = AssetImage('assets/images/$_pointsErrors.png');

class ScreenGame extends StatefulWidget {
  const ScreenGame({super.key});

  @override
  State<ScreenGame> createState() => _ScreenGameState();
}

class _ScreenGameState extends State<ScreenGame> {
  Map<String, Widget> letterAndWidget = {
    for (String letter in _wordChosen.split(''))
      letter: const WordSecret(letter: '')
  };

  Widget letterButton(index) {
    final String letterAlphabet = alphabet[index];

    void pressButton() {
      if (_wordChosen.split('').contains(letterAlphabet)) {
        _pointsHits++;
        _lettersHits.add(letterAlphabet);
        setState(() {
          letterAndWidget[letterAlphabet] = WordSecret(letter: letterAlphabet);
        });
      } else {
        _pointsErrors++;
        _lettersErrors.add(letterAlphabet);
        setState(() {
          _imageHangman = AssetImage('assets/images/$_pointsErrors.png');
        });
      }

      if (_pointsHits == _wordChosen.split('').length) {
        _result = 'PARABÉNS! VOCÊ GANHOU.';

        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenRestart(message: _result),
              ),
            );
          },
        );
      } else if (_pointsErrors == 4) {
        setState(() {
          _tip = 'A DICA É: ${_wordsAndTips.wordsAndTips[_wordChosen]}';
        });
      } else if (_pointsErrors == 6) {
        _result = 'QUE PENA! VOCÊ PERDEU.';
        String answer = 'A RESPOSTA CORRETA ERA: $_wordChosen';

        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenRestart(
                  message: _result,
                  wordCorrect: answer,
                ),
              ),
            );
          },
        );
      }
    }

    return SizedBox(
      width: 50.0,
      height: 50.0,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GestureDetector(
          onTap: _lettersErrors.contains(letterAlphabet) ? null : pressButton,
          child: CircleAvatar(
            backgroundColor: _lettersErrors.contains(letterAlphabet)
                ? Colors.red
                : _lettersHits.contains(letterAlphabet)
                    ? Colors.green
                    : null,
            child: Text(alphabet[index]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Hangman Game',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 220.0,
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: Text(_tip),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            Image(
              width: 160.0,
              height: 160.0,
              image: _imageHangman,
            ),
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: letterAndWidget.values.toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 240.0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  letterButton(0),
                  letterButton(1),
                  letterButton(2),
                  letterButton(3),
                  letterButton(4),
                  letterButton(5),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  letterButton(6),
                  letterButton(7),
                  letterButton(8),
                  letterButton(9),
                  letterButton(10),
                  letterButton(11),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  letterButton(12),
                  letterButton(13),
                  letterButton(14),
                  letterButton(15),
                  letterButton(16),
                  letterButton(17),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  letterButton(18),
                  letterButton(19),
                  letterButton(20),
                  letterButton(21),
                  letterButton(22),
                  letterButton(23),
                  letterButton(24),
                  letterButton(25),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Center(
                  child: Text(
                    'Aluno: Francisco Edson',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

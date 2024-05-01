import 'package:flutter/material.dart';

import 'package:hangman_game/word_secret.dart';

import 'dart:math';

final List<String> alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

final List<String> _listWords = [
  'FUTEBOL',
  'VENTILADOR',
  'PERA',
  'POLEGAR',
];

final List<String> _listTips = [
  'JOGO',
  'OBJETO',
  'FRUTA',
  'DEDO',
];

final _rnd = Random().nextInt(4);

final String _wordChosen = _listWords[_rnd];

List<String> _lettersErrors = [];

List<String> _lettersHits = [];

int _amountError = 0;

int _pointsHits = 0;

int _pointsErrors = 0;

String _tip = '';

String _result = '';

String _letterChosen = '';

AssetImage _imageHangman = AssetImage('assets/images/$_amountError.png');

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
    final letterAlphabet = alphabet[index];

    void pressButton() {
      _letterChosen = letterAlphabet;
      if (letterAndWidget.keys.toList().contains(_letterChosen)) {
        _lettersHits.add(_letterChosen);
        setState(() {
          letterAndWidget[_letterChosen] = WordSecret(letter: _letterChosen);
          _pointsHits++;
        });
      } else {
        _amountError++;
        _lettersErrors.add(letterAlphabet);
        setState(() {
          _imageHangman = AssetImage('assets/images/$_amountError.png');
          _pointsErrors++;
        });
      }

      if (_pointsErrors == 4) {
        setState(() {
          _tip = 'A DICA É: ${_listTips[_rnd]}';
        });
      } else if (_pointsErrors == 6) {
        setState(() {
          _result = 'QUE PENA! VOCÊ PERDEU.';
        });
      } else if (_pointsHits == _wordChosen.split('').length) {
        setState(() {
          _result = 'PARABÉNNNS!!! VOCÊ GANHOU.';
        });
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
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Hangman Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_tip),
            const SizedBox(height: 30.0),
            Image(
              width: 120.0,
              height: 120.0,
              image: _imageHangman,
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: letterAndWidget.values.toList(),
            ),
            const SizedBox(height: 30.0),
            Text(_result),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 250.0,
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
            ],
          ),
        ),
      ),
    );
  }
}

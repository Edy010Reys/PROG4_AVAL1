import 'package:flutter/material.dart';

class WordSecret extends StatefulWidget {
  const WordSecret({
    super.key,
    this.letter,
  });

  final String? letter;

  @override
  State<WordSecret> createState() => _WordSecretState();
}

class _WordSecretState extends State<WordSecret> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          width: 50.0,
          height: 50.0,
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(widget.letter ?? ''),
            ),
          ),
        ),
      ),
    );
  }
}

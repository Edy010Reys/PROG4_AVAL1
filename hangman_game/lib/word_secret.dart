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
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(
        child: Text(widget.letter ?? ''),
      ),
    );
  }
}

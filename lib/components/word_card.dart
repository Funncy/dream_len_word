import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lent_word_card/components/buttons.dart';

class WordCard extends StatelessWidget {
  final String path;
  final Function initCallback;
  const WordCard({Key? key, required this.path, required this.initCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
            child: Container(
      constraints:
          const BoxConstraints(maxWidth: 450, maxHeight: 1200, minHeight: 550),
      child: Column(
        children: [
          Container(
            width: 320,
            child: Image.network(path),
          ),
          const SizedBox(
            height: 20,
          ),
          Buttons(path: path, initCallback: initCallback)
        ],
      ),
    )));
  }
}

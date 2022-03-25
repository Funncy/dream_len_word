import 'package:flutter/material.dart';
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
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 320,
            height: 500,
            child: Image.network(path,
                loadingBuilder: (_, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return const Center(
                child: Text("잠시만 기다려주세요..."),
              );
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          Buttons(path: path, initCallback: initCallback),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                width: 70,
                height: 40,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('assets/img/dream_logo.png'))),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}

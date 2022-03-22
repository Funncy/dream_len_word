import 'package:flutter/material.dart';
import 'package:lent_word_card/components/fifth_card.dart';
import 'package:lent_word_card/components/forth_card.dart';
import 'package:lent_word_card/components/last_card.dart';
import 'package:lent_word_card/components/seconds_card.dart';
import 'package:lent_word_card/components/third_card.dart';
import 'package:lent_word_card/components/word_card.dart';

import 'card_body.dart';
import 'components/first_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController pageController = PageController(
    initialPage: 0,
  );

  int firstChoose = 0;
  int secondsChoose = 0;
  int thirdChoose = 0;
  int forthChoose = 0;

  String path = 'assets/img/lent_word_0000.jpeg';

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void setImage() {
    setState(() {
      path =
          'assets/img/lent_word_$firstChoose$secondsChoose$thirdChoose$forthChoose.jpeg';
    });
  }

  void initPage() {
    pageController.jumpTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
              maxWidth: 450, maxHeight: 900, minHeight: 550),
          child: PageView(
            controller: pageController,
            children: [
              CardBody(
                child: FirstCard(
                  callback: () {
                    nextPage();
                  },
                ),
              ),
              CardBody(
                child: SecondsCard(yes: () {
                  firstChoose = 0;
                  nextPage();
                }, no: () {
                  firstChoose = 1;
                  nextPage();
                }),
              ),
              CardBody(
                child: ThirdCard(yes: () {
                  secondsChoose = 0;
                  nextPage();
                }, no: () {
                  secondsChoose = 1;
                  nextPage();
                }),
              ),
              CardBody(
                child: ForthCard(yes: () {
                  thirdChoose = 0;
                  nextPage();
                }, no: () {
                  thirdChoose = 1;
                  nextPage();
                }),
              ),
              CardBody(
                child: FifthCard(yes: () {
                  forthChoose = 0;
                  nextPage();
                  setImage();
                }, no: () {
                  forthChoose = 1;
                  nextPage();
                  setImage();
                }),
              ),
              CardBody(
                child: LastCard(
                  callback: () {
                    nextPage();
                  },
                ),
              ),
              WordCard(path: path, initCallback: initPage),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_analytics/firebase_analytics.dart';
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

  void sendAnalytics(String title, String answer) {
    FirebaseAnalytics.instance.logEvent(name: title + answer);
  }

  void senFinalAnalytics() {
    String first = firstChoose == 0 ? 'Y' : 'N';
    String seconds = secondsChoose == 0 ? 'Y' : 'N';
    String third = thirdChoose == 0 ? 'Y' : 'N';
    String forth = forthChoose == 0 ? 'Y' : 'N';
    FirebaseAnalytics.instance.logEvent(
      name: "결과 = $first$seconds$third$forth",
    );
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
            physics: const NeverScrollableScrollPhysics(),
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
                  sendAnalytics("요즘 웃을 일이 많으신가요?", "yes");
                  nextPage();
                }, no: () {
                  firstChoose = 1;
                  sendAnalytics("요즘 웃을 일이 많으신가요?", "no");
                  nextPage();
                }),
              ),
              CardBody(
                child: ThirdCard(yes: () {
                  secondsChoose = 0;
                  sendAnalytics("기댈수 있는 공동체가 있나요?", "yes");
                  nextPage();
                }, no: () {
                  secondsChoose = 1;
                  sendAnalytics("기댈수 있는 공동체가 있나요?", "no");
                  nextPage();
                }),
              ),
              CardBody(
                child: ForthCard(yes: () {
                  thirdChoose = 0;
                  sendAnalytics("영적 무기력함을 느끼시나요?", "yes");
                  nextPage();
                }, no: () {
                  thirdChoose = 1;
                  sendAnalytics("영적 무기력함을 느끼시나요?", "no");
                  nextPage();
                }),
              ),
              CardBody(
                child: FifthCard(yes: () {
                  forthChoose = 0;
                  nextPage();
                  sendAnalytics("사순절 예배 꾸준히 참석하고 계신가요?", "yes");
                  setImage();
                }, no: () {
                  forthChoose = 1;
                  nextPage();
                  sendAnalytics("사순절 예배 꾸준히 참석하고 계신가요?", "no");
                  setImage();
                }),
              ),
              CardBody(
                child: LastCard(
                  callback: () {
                    nextPage();
                    senFinalAnalytics();
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

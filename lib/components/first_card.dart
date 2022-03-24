import 'package:flutter/material.dart';

import '../constants.dart';

class FirstCard extends StatelessWidget {
  final Function callback;
  const FirstCard({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const Text(
          "WITH CHRIST",
          style: TextStyle(
              fontFamily: "CK",
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: MainColor),
        ),
        const SizedBox(height: 10),
        const Text(
          "예수를 듣다",
          style: TextStyle(
              fontFamily: "CK",
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: MainColor),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "사순절 기간 우리 마음에 주시는",
          style: TextStyle(
              fontFamily: "SCDream4",
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: MainColor),
        ),
        const Text(
          "예수님의 음성을 들어보세요!",
          style: TextStyle(
              fontFamily: "SCDream4",
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: MainColor),
        ),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () => callback(),
          child: Container(
            width: 90,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: MainColor,
              ),
            ),
            child: const Center(
              child: Text(
                "참여하기",
                style: TextStyle(
                  fontFamily: "SCDream4",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: MainColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

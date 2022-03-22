import 'package:flutter/material.dart';

import '../constants.dart';

class LastCard extends StatelessWidget {
  final Function callback;
  const LastCard({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 70),
        const Text(
          "사순절",
          style: TextStyle(
              fontFamily: "CK",
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: MainColor),
        ),
        const SizedBox(height: 10),
        const Text(
          "나에게 필요한 말씀을",
          style: TextStyle(
              fontFamily: "CK",
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: MainColor),
        ),
        const SizedBox(height: 10),
        const Text(
          "받으시겠습니까?",
          style: TextStyle(
              fontFamily: "CK",
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: MainColor),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () => callback(),
          child: Container(
            width: 60,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: MainColor,
              ),
            ),
            child: const Center(
              child: Text(
                "예",
                style: TextStyle(
                  fontFamily: "SCDream4",
                  fontSize: 12,
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

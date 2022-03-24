import 'package:flutter/material.dart';

import '../constants.dart';

class ThirdCard extends StatelessWidget {
  final Function yes;
  final Function no;
  const ThirdCard({Key? key, required this.yes, required this.no})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        const Text(
          "요즘 기댈 수 있는",
          style: TextStyle(
              fontFamily: "CK",
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: MainColor),
        ),
        const SizedBox(height: 20),
        const Text(
          "공동체가 있나요?",
          style: TextStyle(
              fontFamily: "CK",
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: MainColor),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => yes(),
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
                        fontWeight: FontWeight.w600,
                        color: MainColor,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => no(),
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
                      "아니오",
                      style: TextStyle(
                        fontFamily: "SCDream4",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: MainColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

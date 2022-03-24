import 'package:flutter/material.dart';

import '../constants.dart';

class ForthCard extends StatelessWidget {
  final Function yes;
  final Function no;
  const ForthCard({Key? key, required this.yes, required this.no})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const Text(
          "길어지는",
          style: TextStyle(
              fontFamily: "CK",
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: MainColor),
        ),
        const SizedBox(height: 10),
        const Text(
          "팬데믹 상황으로,",
          style: TextStyle(
              fontFamily: "CK",
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: MainColor),
        ),
        const SizedBox(height: 10),
        const Text(
          "영적 무기력함을",
          style: TextStyle(
              fontFamily: "CK",
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: MainColor),
        ),
        const SizedBox(height: 10),
        const Text(
          "느끼시나요?",
          style: TextStyle(
              fontFamily: "CK",
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: MainColor),
        ),
        const SizedBox(
          height: 20,
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

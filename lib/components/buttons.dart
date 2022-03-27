import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../constants.dart';

class Buttons extends StatefulWidget {
  final String path;
  final Function initCallback;

  const Buttons({Key? key, required this.path, required this.initCallback})
      : super(key: key);

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  void initPage() {}

  void _saveImage(imageUrl) async {
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = imageUrl
      ..style.display = 'none';
    html.document.body?.children.add(anchor);

    // download
    anchor.click();

    // cleanup
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Container(
            width: 250,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: MainColor,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(-3, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                "이미지가 뜨면 화면을 꾹 눌러주세요.\n이미지 저장이 가능합니다.",
                style: TextStyle(fontSize: 16, color: MainColor),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Button(
            text: "이미지 저장하기",
            onPressed: () {
              _saveImage(widget.path);
            },
            width: 170,
            height: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Button(
            text: "말씀 다시 받기",
            onPressed: () {
              widget.initCallback();
            },
            width: 170,
            height: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child: Button(
            text: "꿈의교회 유튜브 채널",
            onPressed: () async {
              // 꿈교 유튜브 보내기
              var youtubeUrl =
                  'https://www.youtube.com/channel/UCaNoaz05HCffa_61Jf_9Qng';

              final anchor =
                  html.document.createElement('a') as html.AnchorElement
                    ..href = youtubeUrl
                    ..style.display = 'none';
              // ..download = '$now.jpg';
              html.document.body?.children.add(anchor);

              // download
              anchor.click();

              // cleanup
              html.document.body?.children.remove(anchor);
              html.Url.revokeObjectUrl(youtubeUrl);
            },
            width: 170,
            height: 40,
          ),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  Button(
      {required this.onPressed,
      required this.width,
      required this.height,
      required this.text});

  final Function onPressed;
  final double width;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: MainColor,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: "SCDream4",
              fontSize: 12,
              color: MainColor,
            ),
          ),
        ),
      ),
    );
  }
}

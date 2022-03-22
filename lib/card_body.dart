import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  final Widget child;
  const CardBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
                maxWidth: 450, maxHeight: 900, minHeight: 550),
            height: size.height,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 250,
                  child: Container(
                    width: 300,
                    height: 400,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                NetworkImage('assets/img/background01.png'))),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(-3, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: child,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 280,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage('assets/img/background02.png'))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

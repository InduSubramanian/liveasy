import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  // final bool active  @required this.active;
  final bool mainBg;
  final bool active;
  const Background({
    Key key,
    @required this.child,
    @required this.active,
    @required this.mainBg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        child: Stack(
          children: [
            mainBg
                ? Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      './assets/images/Bg2.png',
                      fit: BoxFit.fitWidth,
                    ))
                : active
                    ? Stack(
                        children: [
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Image.asset(
                                './assets/images/Bg1_Active.png',
                                fit: BoxFit.fitWidth,
                              )),
                        ],
                      )
                    : Stack(children: [
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Image.asset(
                              './assets/images/Bg1_Inactive_back.png',
                              fit: BoxFit.fitWidth,
                            )),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            './assets/images/Bg1_Inactive.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ]),
            child,
          ],
        ));
  }
}

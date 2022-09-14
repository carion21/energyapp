import 'package:energy/constants.dart';
import 'package:flutter/material.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Transform.rotate(
          angle: 32,
          child: Container(
            width: width * 1.5,
            decoration: const BoxDecoration(
              color: appColor3,
            ),
          ),
        ),
        Transform.rotate(
          angle: 6,
          alignment: Alignment.bottomLeft,
          child: Container(
              width: width * 2,
              height: height * 2,
              decoration: const BoxDecoration(
                color: appColor2,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 170, horizontal: 80),
                    child: Wrap(
                      direction: Axis.horizontal, //Vertical || Horizontal
                      children: <Widget>[
                        Transform.rotate(
                            angle: 38,
                            child: const Text(loginText1,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                  // height: 5.5
                                ))),
                      ],
                    ),
                  )
                ],
              )),
        ),
        Transform.rotate(
          angle: 1,
          alignment: Alignment.topRight,
          child: Container(
            width: width * 0.5,
            decoration: const BoxDecoration(
              color: appColor1,
            ),
          ),
        ),
      ],
    );
  }
}

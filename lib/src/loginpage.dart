// ignore_for_file: avoid_unnecessary_containers

import 'package:energy/constants.dart';
import 'package:energy/src/homepage.dart';
import 'package:energy/src/widget/logincontainer.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            Positioned(height: height * 0.43, child: const LoginContainer()),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: height * .55),
                        _usernameWidget(),
                        const SizedBox(height: 20),
                        _passwordWidget(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  _submitButton(context),
                  SizedBox(height: height * .035)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _usernameWidget() {
    return TextFormField(
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(
            color: Color.fromRGBO(173, 183, 192, 1),
            fontWeight: FontWeight.bold),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(173, 183, 192, 1)),
        ),
      ),
    );
  }

  Widget _passwordWidget() {
    return TextFormField(
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'Mot de passe',
        labelStyle: TextStyle(
            color: Color.fromRGBO(173, 183, 192, 1),
            fontWeight: FontWeight.bold),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(173, 183, 192, 1)),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        child: Stack(children: [
          Positioned(
            right: 20,
            child: SizedBox.fromSize(
              size: const Size.square(80.0), // button width and height
              child: const ClipOval(
                child: Material(
                  color: Color.fromRGBO(252, 228, 138, 1), // button color
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: appColor2,
                width: 1,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(right: 50, bottom: 20),
              child: Text(
                loginText2,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    height: 1.6),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

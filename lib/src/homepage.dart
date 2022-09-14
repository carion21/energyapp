// ignore_for_file: sized_box_for_whitespace

import 'package:energy/constants.dart';
import 'package:energy/src/evaluationpage.dart';
import 'package:energy/src/historiquepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: buildAppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton(btnText1, "eval"),
                buildButton(btnText2, "histo"),
                buildButton(logoutText, "logout"),
              ],
            ),
          ),
        ),
        onWillPop: showExitPopup);
  }

  AppBar buildAppBar() {
    return AppBar(
        title: const Text(
          homeText1,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: appColor2,
        centerTitle: true,
        leading: Container());
  }

  Widget buildButton(String text, String route) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          elevation: 10,
          color: Colors.grey[200],
          child: InkWell(
            onTap: () {
              if (route == "eval") {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EvaluationPage()));
              }
              if (route == "histo") {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HistoriquePage()));
              }
              if (route == "logout") {
                // TODO: logout
              }
            },
            splashColor: appColor1,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.18,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Quitter Energy'),
            content: const Text('Voulez vous vraiment sortir ???'),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(appColor2),
                ),
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: const Text('Non'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(appColor1),
                ),
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Oui'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }
}

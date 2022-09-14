import 'package:energy/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultatPage extends StatefulWidget {
  const ResultatPage({super.key, required this.prediction});

  final int prediction;

  @override
  _ResultatPageState createState() => _ResultatPageState();
}

class _ResultatPageState extends State<ResultatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(child: showCardResultat()),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        title: const Text(
          resultatText1,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: appColor2,
        centerTitle: true);
  }

  Widget showCardResultat() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                child: const Icon(
                  Icons.person,
                  size: 200,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
                child: widget.prediction == 1
                  ? const Icon(
                      Icons.thumb_up,
                      size: 100,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.thumb_down,
                      size: 100,
                      color: Colors.red,
                    )
                    ,
              ),
            ],
          ),
          Column(
            children: [
              showInfoResultat()
            ],
          ),
        ],
      ),
    );
  }

  Widget showInfoResultat() {
    return Column(children: [
      Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.1),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: const Text(
              "Résultat",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              widget.prediction == 1 ? resultatText2 : resultatText3,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      SizedBox(height: MediaQuery.of(context).size.width * 0.03),
    ]);
  }
}

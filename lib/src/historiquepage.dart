import 'package:energy/constants.dart';
import 'package:flutter/material.dart';

class HistoriquePage extends StatefulWidget {
  const HistoriquePage({Key? key}) : super(key: key);

  @override
  _HistoriquePageState createState() => _HistoriquePageState();
}

class _HistoriquePageState extends State<HistoriquePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(child: showList()),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        histoText1,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: appColor2,
      centerTitle: true,
    );
  }

  Widget showList() {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return showElementList(context);
      },
    );
  }

  Widget showElementList(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.8,
        child: showCardHisto());
  }

  Widget showCardHisto() {
    return Card(
      child: Column(children: [
        showElementHisto("Offre", "NIWA_Kit Premium"),
        showElementHisto("Prix d'Entrée", "15230"),
        showElementHisto("Prix d'Ouverture", "300000"),
        showElementHisto("Date", "12/12/2021 12:12:12"),
        showElementHisto("Region", "CENTRE")
      ]),
    );
  }

  Widget showElementHisto(String label, String valeur) {
    return Column(children: [
      SizedBox(height: MediaQuery.of(context).size.width * 0.005),
      Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.1),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              label,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              valeur,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
      SizedBox(height: MediaQuery.of(context).size.width * 0.003),
    ]);
  }
}

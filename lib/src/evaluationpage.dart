import 'dart:convert';
import 'package:energy/src/resultatpage.dart';
import 'package:http/http.dart' as http;

import 'package:energy/constants.dart';
import 'package:energy/webservices/api.dart';
import 'package:flutter/material.dart';

class EvaluationPage extends StatefulWidget {
  const EvaluationPage({super.key});

  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String groupname = "";
  int upfront = 0;
  int unlock = 0;
  String gender = "";
  int age = 0;
  String occupation = "";
  String langue = "";
  String region = "";

  Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Entrez vos informations",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buildSelect("Group Name", "groupname", groupnames),
                      const SizedBox(
                        height: 20,
                      ),
                      buildNumField("Upfront Price", "upfront"),
                      const SizedBox(
                        height: 20,
                      ),
                      buildNumField("Unlock Price", "unlock"),
                      const SizedBox(
                        height: 20,
                      ),
                      buildSelect("Customer Gender", "gender", genders),
                      const SizedBox(
                        height: 20,
                      ),
                      buildNumField("Customer Age", "age"),
                      const SizedBox(
                        height: 20,
                      ),
                      buildSelect(
                          "Customer Occupation", "occupation", occupations),
                      const SizedBox(
                        height: 20,
                      ),
                      buildSelect("Langue", "langue", langues),
                      const SizedBox(
                        height: 20,
                      ),
                      buildSelect("Region", "region", regions),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(60)),
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            submit();
                          }
                        },
                        child: const Text(
                          "Soumettre",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        evalText1,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: appColor2,
      centerTitle: true,
    );
  }

  void setVariable(String variable, String valeur) {
    switch (variable) {
      case "groupname":
        setState(() {
          groupname = valeur;
        });
        break;
      case "upfront":
        print(valeur);
        setState(() {
          upfront = int.parse(valeur);
        });
        break;
      case "unlock":
        setState(() {
          unlock = int.parse(valeur);
        });
        break;
      case "gender":
        setState(() {
          gender = valeur;
        });
        break;
      case "age":
        setState(() {
          age = int.parse(valeur);
          print("*****************************");
        });
        break;
      case "occupation":
        setState(() {
          occupation = valeur;
        });
        break;
      case "langue":
        setState(() {
          langue = valeur;
        });
        break;
      case "region":
        setState(() {
          region = valeur;
        });
        break;
      default:
    }
  }

  Widget buildTextField(String label, String variable) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: label,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.grey, width: 0.0),
          ),
          border: const OutlineInputBorder()),
      onFieldSubmitted: (value) {
        setState(() {
          variable = value;
        });
      },
      onChanged: (value) {
        setState(() {
          variable = value;
        });
        debugPrint("La nouvelle valeur est $variable");
      },
    );
  }

  Widget buildNumField(String label, String variable) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: label,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.grey, width: 0.0),
          ),
          border: const OutlineInputBorder()),
      onFieldSubmitted: (value) {
        setVariable(variable, value);
      },
      onChanged: (value) {
        setVariable(variable, value);
      },
    );
  }

  Widget buildSelect(String label, String variable, List<String> options) {
    List<DropdownMenuItem> items = [];
    for (var i = 0; i < options.length; i++) {
      String text = options[i];
      int nst = 30;
      if (text.length > nst) {
        text = "${text.substring(0, nst)}...";
      }
      items.add(DropdownMenuItem(
        child: Text(text),
        value: options[i],
      ));
    }
    return DropdownButtonFormField(
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            ),
            border: OutlineInputBorder()),
        items: items,
        hint: Text('Select $label'),
        onChanged: (value) {
          setVariable(variable, value);
        },
        onSaved: (value) {
          setState(() {
            variable = value;
          });
          debugPrint("La nouvelle valeur est $value");
        });
  }

  Future<void> submit() async {
    var bdata = {
      "groupname": groupname,
      "upfront": upfront,
      "unlock": unlock,
      "gender": gender,
      "age": age,
      "occupation": occupation,
      "langue": langue,
      "region": region
    };
    print(bdata);
    if (groupname != "" &&
        upfront != 0 &&
        unlock != 0 &&
        gender != "" &&
        age != 0 &&
        occupation != "" &&
        langue != "" &&
        region != "") {
      String url = "${api.urlServer}predict";
      print(url);
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(bdata),
      );

      int prediction = 0;

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        prediction = int.parse(data["prediction"]);
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultatPage(prediction: prediction)),
        );
      } else {
        throw Exception('Failed to send data for evaluation');
      }
    } else {
      debugPrint("Il manque des informations");
    }
  }
}

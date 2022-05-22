import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_edspert/view/bmi_calculator.dart';
import '../model/gender.dart';
import '../styles/styles.dart';
import '../widgets/card_radio_custom.dart';

class GenderOptionsPage extends StatefulWidget {
  const GenderOptionsPage({Key? key}) : super(key: key);

  @override
  State<GenderOptionsPage> createState() => _GenderOptionsPageState();
}

class _GenderOptionsPageState extends State<GenderOptionsPage> {
  List<Gender> genders = <Gender>[];
  String gender = "";

  @override
  void initState() {
    super.initState();
    genders.add(Gender("MALE", Icons.male, false));
    genders.add(Gender("FEMALE", Icons.female, false));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(SetColor.primary),
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          centerTitle: true,
          backgroundColor: const Color(SetColor.primary),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: genders.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.pinkAccent,
                          onTap: () {
                            setState(() {
                              genders.forEach(
                                  (gender) => gender.isSelected = false);
                              genders[index].isSelected = true;
                            });
                            if (index == 0) {
                              gender = "M";
                            } else {
                              gender = "F";
                            }
                          },
                          child: CustomRadio(genders[index]),
                        );
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (gender != "") {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => BodyMassIndexCalculator(
                                  gender: gender,
                                )),
                      );
                    } else {
                      showAlertDialog(context);
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                        color: const Color(SetColor.secondary),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Center(
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                        Icon(
                          Icons.navigate_next_rounded,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("WARNING"),
      content: Text("Choose your gender first."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

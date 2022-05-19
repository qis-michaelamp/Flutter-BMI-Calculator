import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bootcamp_edspert/model/gender.dart';
import 'package:flutter_bootcamp_edspert/styles/styles.dart';
import 'package:flutter_bootcamp_edspert/view/bmi_calculate_result.dart';
import 'package:flutter_bootcamp_edspert/widgets/card_radio_custom.dart';
import 'package:numberpicker/numberpicker.dart';

class BodyMassIndexCalculator extends StatefulWidget {
  const BodyMassIndexCalculator({Key? key}) : super(key: key);

  @override
  State<BodyMassIndexCalculator> createState() =>
      _BodyMassIndexCalculatorState();
}

class _BodyMassIndexCalculatorState extends State<BodyMassIndexCalculator> {
  double _height = 100;
  double _weight = 60;
  double _age = 20;

  Widget _buildCardSlider(IconData icon, String menuTitle) {
    return Card(
      color: const Color(SetColor.primary).withOpacity(0.1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              menuTitle,
              style: SetFontStyle.menuTitle,
            ),
            Text(
              _height.toInt().toString() + " cm",
              style: SetFontStyle.numStyle,
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.red[700],
                inactiveTrackColor: Colors.red[100],
                trackShape: const RoundedRectSliderTrackShape(),
                trackHeight: 4.0,
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Colors.redAccent,
                overlayColor: Colors.red.withAlpha(32),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 28.0),
                tickMarkShape: const RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.red[700],
                inactiveTickMarkColor: Colors.red[100],
                valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.redAccent,
                valueIndicatorTextStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Slider(
                value: _height,
                min: 0,
                max: 250,
                divisions: 250,
                activeColor: const Color(SetColor.secondary),
                inactiveColor: const Color(SetColor.primary).withOpacity(0.9),
                onChanged: (value) {
                  setState(() {
                    _height = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardButton(IconData icon, String menuTitle) {
    return Card(
      color: const Color(SetColor.primary).withOpacity(0.1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              menuTitle,
              style: SetFontStyle.menuTitle,
            ),
            Text(
              menuTitle == "WEIGHT"
                  ? _weight.toString() + " kg"
                  : _age.toString(),
              style: SetFontStyle.numStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (menuTitle == "WEIGHT") {
                        if (_weight > 0) {
                          _weight -= 0.5;
                        }
                      } else {
                        if (_age > 0) {
                          _age -= 1;
                        }
                      }
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: const Center(
                      child: Icon(Icons.exposure_minus_1, color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (menuTitle == "WEIGHT") {
                        _weight += 0.5;
                      } else {
                        _age += 1;
                      }
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: const Center(
                      child: Icon(Icons.plus_one, color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCardButtonNumberPicker(IconData icon, String menuTitle) {
    return Card(
      color: const Color(SetColor.primary).withOpacity(0.1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              menuTitle,
              style: SetFontStyle.menuTitle,
            ),
            // Text(
            //   menuTitle == "WEIGHT"
            //       ? _weight.toString() + " kg"
            //       : _age.toString(),
            //   style: SetFontStyle.numStyle,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                NumberPicker(
                  itemHeight: 40,
                  value: menuTitle == "WEIGHT" ? _weight.toInt() : _age.toInt(),
                  minValue: 0,
                  maxValue: 100,
                  onChanged: (value) => setState(
                    () => menuTitle == "WEIGHT"
                        ? _weight = value.toDouble()
                        : _age = value.toDouble(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Gender> genders = <Gender>[];

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
                          },
                          child: CustomRadio(genders[index]),
                        );
                      },
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: _buildCardSlider(Icons.height, "HEIGHT"),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child:
                            _buildCardButtonNumberPicker(Icons.male, "WEIGHT"),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child:
                            _buildCardButtonNumberPicker(Icons.female, "AGE"),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BodyMassIndexResult(
                          height: _height,
                          weight: _weight,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                        color: const Color(SetColor.secondary),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        "CALCULATE YOUR BMI",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_edspert/styles/styles.dart';
import 'dart:math';

class BodyMassIndexResult extends StatelessWidget {
  BodyMassIndexResult({required this.weight, required this.height});

  double weight = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    String _bmiCategory = "Normal";
    double _bmiResult = weight / pow((height / 100), 2);
    String _bmiHealthRisk = "Normal";
    int _healthRisk = 0;

    String bmiCategory() {
      if (_bmiResult < 16) {
        _bmiCategory = "Underweight (Severe Thinness)";
      } else if (_bmiResult >= 16 && _bmiResult < 17) {
        _bmiCategory = "Underweight (Moderate Thinness)";
      } else if (_bmiResult >= 17 && _bmiResult < 18.5) {
        _bmiCategory = "Underweight (Mild Thinness)";
      } else if (_bmiResult >= 18.5 && _bmiResult < 25) {
        _bmiCategory = "Normal";
        _healthRisk = 1;
      } else if (_bmiResult >= 25 && _bmiResult < 30) {
        _bmiCategory = "Overweight (Pre-Obese)";
        if (_bmiResult < 27.5) {
          _healthRisk = 1;
        } else {
          _healthRisk = 2;
        }
      } else if (_bmiResult >= 30 && _bmiResult < 35) {
        _bmiCategory = "Obese (Class I)";
        _healthRisk = 2;
      } else if (_bmiResult >= 35 && _bmiResult < 40) {
        _bmiCategory = "Obese (Class II)";
        _healthRisk = 2;
      } else if (_bmiResult >= 40) {
        _bmiCategory = "Obese (Class III)";
        _healthRisk = 2;
      }

      return _bmiCategory;
    }

    String bmiHealthRisk() {
      switch (_healthRisk) {
        case 1:
          _bmiHealthRisk = "Low risk (healthy range)";
          break;
        case 2:
          _bmiHealthRisk =
              "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus";
          break;
        case 3:
          _bmiHealthRisk =
              "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome.";
          break;
        default:
          _bmiHealthRisk = "Possible nutritional deficiency and osteoporosis";
          break;
      }

      return _bmiHealthRisk;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          centerTitle: true,
          backgroundColor: const Color(SetColor.primary),
        ),
        backgroundColor: const Color(SetColor.primary),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Your BMI Result",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Card(
                    color: const Color(SetColor.primary).withOpacity(0.2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          bmiCategory(),
                          style: const TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _bmiResult.toStringAsFixed(1),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 80),
                        ),
                        Text(
                          bmiHealthRisk(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        "RE-CALCULATE BMI",
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

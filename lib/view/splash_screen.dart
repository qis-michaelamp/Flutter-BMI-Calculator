import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_edspert/styles/styles.dart';
import 'package:flutter_bootcamp_edspert/view/bmi_calculator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const BodyMassIndexCalculator()));
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Color(SetColor.primary)),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Center(
                  child: Text(
                    "BMI Calculator",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(100),
                //   ),
                //   // child: Image.network('https://picsum.photos/200'),
                //   child:
                // ),
                Image(
                  image: AssetImage("assets/icons/bmi_icon.png"),
                  height: 100,
                ),
                Center(
                  child: Text(
                    "Michael Andhika",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
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

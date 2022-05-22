import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_edspert/styles/styles.dart';
import 'package:flutter_bootcamp_edspert/view/gender_options.dart';

import 'bmi_calculator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const GenderOptionsPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color(SetColor.primary),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Image(
                  image: AssetImage("assets/icons/bmi_icon.png"),
                  height: 100,
                ),
                Center(
                  child: Text(
                    "Body Mass Index Calculator",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
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
}

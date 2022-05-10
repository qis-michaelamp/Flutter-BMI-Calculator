import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_edspert/styles/styles.dart';
import 'package:flutter_bootcamp_edspert/view/bmi_calculator.dart';
import 'package:flutter_bootcamp_edspert/view/splash_screen.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bootcamp Flutter',
      // home: const MyHomePage(title: 'Bootcamp Flutter - Michael Andhika'),
      // home: BodyMassIndexCalculator(),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isCounterStart = false;
  String _dateFormat = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
      _isCounterStart = _counter > 0 ? true : false;
      DateTime now = DateTime.now();
      _dateFormat = DateFormat('dd-MMM-yyyy HH:mm:ss').format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            _isCounterStart
                ? Text(
                    'Last pressed counter : ' + '$_dateFormat',
                  )
                : Text(""),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

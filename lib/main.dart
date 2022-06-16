import 'package:ds_bmi_calculator/output_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'output_page.dart';
import 'package:flutter/services.dart';
import 'package:ds_bmi_calculator/home_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff111428),
        scaffoldBackgroundColor: Color(0xff111428),
        shadowColor: Color(0xFFEEF1F9),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/first': (context) => InputPage(),
        '/second': (context) => OutputPage(),
      },
    );
  }
}

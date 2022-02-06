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
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff111428),
        scaffoldBackgroundColor: Color(0xff111428),
        shadowColor: Color(0xFFEEF1F9),
        /*accentColor: Color(0xff81CB82),
        canvasColor: Colors.amberAccent,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        )
        dividerColor: Color(0xFFEEF1F9),
        hoverColor: Color(0xFF4DF214),*/
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

/*floatingActionButton: Theme(
        data: ThemeData(
          accentColor: Color(0xff81CB82),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.volunteer_activism),
        ),
      ),*/

import 'container_cards.dart';
import 'package:ds_bmi_calculator/input_page.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:ds_bmi_calculator/calculator_brain.dart';

class OutputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalculatorBrain calc =
        ModalRoute.of(context)!.settings.arguments as CalculatorBrain;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.home_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
        title: Text(
          'BMI CALCULATOR',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your Parameters',
              style: kOutputText,
              textAlign: TextAlign.center,
            ),
            Expanded(
              flex: 5,
              child: ContainerCard(
                myColor: kInactiveBoxColors,
                myCardDetails: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      calc.calculateBMI(),
                      style: kNumberStyles,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      calc.resultBMI().toUpperCase(),
                      style: kResultText,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Normal BMI Range : \n 18.5 - 25 kg/m2',
                      style: TextStyle(
                        color: Color(0xFFF9E1B1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      calc.analysisBMI(),
                      style: kAnalysisTextStyles,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BottomButtons(
              buttonText: 'Re-Calculate',
              onTap: () {
                Navigator.pushNamed(context, '/first');
              },
            ),
          ],
        ),
      ),
    );
  }
}

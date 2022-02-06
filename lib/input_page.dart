//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
//import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'container_cards.dart';
import 'first_line_containers.dart';
import 'package:ds_bmi_calculator/container_cards.dart';
import 'package:ds_bmi_calculator/constants.dart';
import 'package:ds_bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int heightStartValue = 180;
  int weightStartValue = 60;
  int ageStartValue = 21;

  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    myColor: selectedGender == Gender.male
                        ? kActiveBoxColors
                        : kInactiveBoxColors,
                    myCardDetails: FirstLineContainers(
                      myStrings: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    myColor: selectedGender == Gender.female
                        ? kActiveBoxColors
                        : kInactiveBoxColors,
                    myCardDetails: FirstLineContainers(
                      myIcons: Icon(FontAwesomeIcons.female),
                      myStrings: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerCard(
              myColor: kInactiveBoxColors,
              myCardDetails: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyles,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        heightStartValue.toString(),
                        style: kNumberStyles,
                      ),
                      SizedBox(width: 3),
                      Text(
                        'Cms',
                        style: kTextColor,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kActiveTrackColor,
                      inactiveTrackColor: kInactiveTrackColor,
                      thumbColor: kThumbColor,
                      overlayColor: kOverlayColor,
                      thumbShape: kThumbShape,
                      overlayShape: kOverlayShape,
                      valueIndicatorShape: kValueIndicatorShape,
                      valueIndicatorColor: kValueIndicatorColor,
                    ),
                    child: Slider(
                      value: heightStartValue.toDouble(),
                      min: 80,
                      max: 240,
                      divisions: 160,
                      label: "$heightStartValue",
                      onChanged: (double changedValue) {
                        setState(() {
                          heightStartValue = changedValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerCard(
                    myColor: kInactiveBoxColors,
                    myCardDetails: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kTextStyles),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weightStartValue.toString(),
                              style: kNumberStyles,
                            ),
                            SizedBox(width: 3),
                            Text(
                              'KGs',
                              style: kTextColor,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              iconMarker: FontAwesomeIcons.minus,
                              afterPress: () {
                                setState(() {
                                  weightStartValue--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CustomButton(
                              iconMarker: FontAwesomeIcons.plus,
                              afterPress: () {
                                setState(() {
                                  weightStartValue++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerCard(
                    myColor: kInactiveBoxColors,
                    myCardDetails: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyles,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              ageStartValue.toString(),
                              style: kNumberStyles,
                            ),
                            SizedBox(width: 3),
                            Text(
                              'Yrs',
                              style: kTextColor,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                                afterPress: () {
                                  setState(() {
                                    ageStartValue--;
                                  });
                                },
                                iconMarker: FontAwesomeIcons.minus),
                            SizedBox.fromSize(
                              size: Size(20, 0),
                            ),
                            CustomButton(
                                afterPress: () {
                                  setState(() {
                                    ageStartValue++;
                                  });
                                },
                                iconMarker: FontAwesomeIcons.plus),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButtons(
            buttonText: 'Calculate Your BMI',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                  weight: weightStartValue, height: heightStartValue);
              Navigator.pushNamed(
                context,
                '/second',
                arguments: calc,
              );
            },
          ),
        ],
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  BottomButtons({this.buttonText, this.onTap});

  final String? buttonText;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        padding: EdgeInsets.only(top: 21),
        child: Text(
          buttonText!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            fontSize: 20,
          ),
        ),
        margin: EdgeInsets.all(10),
        height: kBottomBarHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kBottomContainerColor,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({@required this.iconMarker, this.afterPress});

  final IconData? iconMarker;
  final Function? afterPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconMarker),
      onPressed: () {
        afterPress!();
      },
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      highlightColor: Color(0x294C4F5E),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
    );
  }
}

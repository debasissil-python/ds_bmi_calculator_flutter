import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ds_bmi_calculator/constants.dart';

class FirstLineContainers extends StatelessWidget {
  FirstLineContainers(
      {this.myIcons = const Icon(FontAwesomeIcons.male), this.myStrings});

  final Icon myIcons;
  final String? myStrings;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          myIcons.icon,
          size: 60.0,
        ),
        SizedBox(height: 15),
        Text(myStrings!, style: kTextStyles),
      ],
    );
  }
}

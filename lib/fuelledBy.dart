import 'package:flutter/material.dart';

class FuelledByInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(bottom: 15),
      child: Text(
        'fuelled by:\n CodoWeb',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Pacifico',
          color: Colors.orange,
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 2,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

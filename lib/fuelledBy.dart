import 'package:flutter/material.dart';

class FuelledByInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(bottom: 15),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'fuelled by :',
            textAlign: TextAlign.end,
            style: TextStyle(
                color: Colors.blueGrey,
                fontStyle: FontStyle.italic,
                fontSize: 10,
                decoration: TextDecoration.none),
          ),
          Text(
            'Hobby Networking',
            textAlign: TextAlign.end,
            style: TextStyle(
                color: Colors.blueGrey,
                fontStyle: FontStyle.italic,
                fontSize: 15,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}

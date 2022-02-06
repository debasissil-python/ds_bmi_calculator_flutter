import 'package:flutter/material.dart';
import 'fuelledBy.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bmicalculator.jpg"),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/first');
            },
            child: Text(
              'Click To Proceed',
              style: TextStyle(color: Colors.greenAccent),
            ),
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              primary: Colors.black.withOpacity(.5),
              onSurface: Colors.blue,
              shadowColor: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          FuelledByInfo(),
        ],
      ),
    );
  }
}

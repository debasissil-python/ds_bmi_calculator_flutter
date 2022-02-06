import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  ContainerCard({this.myColor, this.myCardDetails, this.onPress});

  final Color? myColor;
  final Widget? myCardDetails;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onPress?.call()},
      child: Container(
        child: myCardDetails,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: myColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}

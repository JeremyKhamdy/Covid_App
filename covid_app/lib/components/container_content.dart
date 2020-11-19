import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class ContainerContent extends StatelessWidget {

  final String text;
  final number;
  final numberColor;
  final data;

  const ContainerContent({
    Key key,
    this.text,
    this.number,
    this.data,
    this.numberColor
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white12,
      ),
      height: (size.height - 15) * 0.3,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: numberColor,
              fontSize: 40,
            ),
          ),
          SizedBox(width: double.infinity, height: size.height * 0.01, ),
          Text(
            text,
            style: TextStyle(
                color: Colors.black12,
                // fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
          SizedBox(height: size.height * 0.02,),
          Sparkline(
            data: data,
          )
        ],
      ),
    );
  }
}

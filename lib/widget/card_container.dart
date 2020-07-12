import 'package:covid_app/widget/constant.dart';
import 'package:flutter/material.dart';

class SymptonCard extends StatelessWidget {
  final String image;
  final String text;
  const SymptonCard({
    Key key,
    this.image,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 115,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 30,
            color: kShadowColor,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 8),
          Container(
            width: 60,
            height: 60,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: kSubTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

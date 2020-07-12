import 'package:covid_app/widget/constant.dart';
import 'package:flutter/material.dart';

class CounterCase extends StatelessWidget {
  final Color color;
  final String text;
  final num number;
  const CounterCase({
    Key key,
    this.color,
    this.text,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 25,
        width: 25,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(.25),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(color: color, width: 2.3),
          ),
        ),
      ),
      SizedBox(height: 10),
      Text(
        "$number",
        style: TextStyle(
          color: color,
          fontSize: 25,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      Text(text, style: kSubTextStyle),
    ]);
  }
}

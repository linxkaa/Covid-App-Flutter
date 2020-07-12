import 'package:covid_app/widget/constant.dart';
import 'package:flutter/material.dart';

Widget buildErrorUI(String message) {
  return Center(
      child: Text(
    message,
    style: kHeadingTextStyle,
  ));
}

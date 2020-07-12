import 'package:covid_app/widget/app_header.dart';
import 'package:covid_app/widget/card_container.dart';
import 'package:covid_app/widget/constant.dart';
import 'package:covid_app/widget/prevent_card.dart';
import 'package:flutter/material.dart';

class SymptonsDetailedPage extends StatefulWidget {
  @override
  _SymptonsDetailedPageState createState() => _SymptonsDetailedPageState();
}

class _SymptonsDetailedPageState extends State<SymptonsDetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            AppHeader(
              image: 'assets/icons/coronadr.svg',
              topText: 'Get to know',
              bottomText: 'About Covid-19',
            ),
            Positioned(
              top: 51,
              left: 15,
              child: InkWell(
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text("Learn the symptons", style: kTitleTextstyle),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SymptonCard(
                      image: 'assets/images/headache.png',
                      text: 'Headache',
                    ),
                    Spacer(),
                    SymptonCard(
                      image: 'assets/images/fever.png',
                      text: 'Fever',
                    ),
                    Spacer(),
                    SymptonCard(
                      image: 'assets/images/caugh.png',
                      text: 'Cough',
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text("Prevention", style: kTitleTextstyle),
                SizedBox(height: 5),
                PreventCard(
                  text:
                      "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                  image: "assets/images/wear_mask.png",
                  title: "Wear face mask",
                ),
                PreventCard(
                  text:
                      "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                  image: "assets/images/wash_hands.png",
                  title: "Wash your hands",
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

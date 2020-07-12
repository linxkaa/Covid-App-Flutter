import 'package:covid_app/data/models/corona_countries.dart';
import 'package:covid_app/utils/helper.dart';
import 'package:covid_app/widget/constant.dart';
import 'package:flutter/material.dart';

class DetailsCountryPage extends StatelessWidget {
  final CoronaCountry country;
  final Helper helper = Helper();
  DetailsCountryPage({@required this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        height: 540,
        padding: EdgeInsets.only(right: 30, left: 30, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          height: 30,
                          width: 30,
                          child: Image.network(country.countryInfo.flag)),
                      SizedBox(width: 13),
                      Center(
                          child: Text(
                        '${country.country}\n${helper.miliSecondsToDateYear(country.updated)}',
                        style: kTitleTextstyle,
                      )),
                      Spacer(),
                      InkWell(
                        child: Icon(Icons.close),
                        onTap: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  DetailedText(
                      country: country.cases,
                      text: 'Total Cases',
                      img: '002-medical mask.png'),
                  SizedBox(height: 2),
                  Divider(),
                  SizedBox(height: 4),
                  DetailedText(
                      country: country.active,
                      text: 'Active Cases',
                      img: '027-medical prescription.png'),
                  SizedBox(height: 2),
                  Divider(),
                  SizedBox(height: 4),
                  DetailedText(
                      country: country.todayCases,
                      text: 'Today Cases',
                      img: '014-pharmacy.png'),
                  SizedBox(height: 2),
                  Divider(),
                  SizedBox(height: 4),
                  DetailedText(
                      country: country.deaths,
                      text: 'Deaths',
                      img: '015-capsules.png'),
                  SizedBox(height: 2),
                  Divider(),
                  SizedBox(height: 4),
                  DetailedText(
                      country: country.todayDeaths,
                      text: 'Today Deaths',
                      img: '035-pharmacy.png'),
                  SizedBox(height: 2),
                  Divider(),
                  SizedBox(height: 4),
                  DetailedText(
                      country: country.recovered,
                      text: 'Recovered',
                      img: '004-stethoscope.png'),
                  SizedBox(height: 2),
                  Divider(),
                  SizedBox(height: 4),
                  DetailedText(
                      country: country.todayRecovered,
                      text: 'Today Recovered',
                      img: '029-medicine.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailedText extends StatelessWidget {
  const DetailedText({
    Key key,
    @required this.country,
    this.text,
    this.img,
  }) : super(key: key);

  final country;
  final String text;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 40,
          width: 40,
          child: Image.asset('assets/images/$img', fit: BoxFit.fill),
        ),
        SizedBox(width: 20),
        Text(
          '$text      :       ',
          style: kSubTextStyle.copyWith(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        Spacer(),
        Text(
          '${country}',
          style: kSubTextStyle.copyWith(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

import 'package:covid_app/blocs/CoronaEachCountry/coronaeachcountry_bloc.dart';
import 'package:covid_app/blocs/FilteredCountriesBloc/filteredcountries_bloc.dart';
import 'package:covid_app/data/models/corona_countries.dart';
import 'package:covid_app/pages/country_details_page.dart';
import 'package:covid_app/pages/loading_page.dart';
import 'package:covid_app/route.dart';
import 'package:covid_app/utils/helper.dart';
import 'package:covid_app/widget/app_header.dart';
import 'package:covid_app/widget/bottom_sheet.dart';
import 'package:covid_app/widget/card_container.dart';
import 'package:covid_app/widget/constant.dart';
import 'package:covid_app/widget/counter_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final Helper helper = Helper();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredcountriesBloc, FilteredCountriesState>(
        builder: (context, state) {
      if (state is FilteredCountriesILoadingState) {
        return LoadingPage();
      } else if (state is FilteredCountriesISuccessState) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppHeader(
                image: 'assets/icons/Drcorona.svg',
                topText: 'All you need',
                bottomText: 'is stay at home',
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 30, right: 40),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey[300]),
                ),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                    SizedBox(width: 10),
                    BlocBuilder<CoronaeachcountryBloc, num>(
                        builder: (context, eachCountryState) {
                      final CoronaCountry coronaCountry = state.countries
                          .firstWhere((country) =>
                              country.countryInfo.id == eachCountryState);
                      return Text(coronaCountry.country,
                          style: TextStyle(color: kBodyTextColor));
                    }),
                    Spacer(),
                    InkWell(
                      child: Icon(Icons.arrow_forward_ios,
                          color: Colors.blue[600]),
                      onTap: () {
                        Navigator.of(context).pushNamed(mainRoute.countries);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              BlocBuilder<CoronaeachcountryBloc, num>(
                  builder: (context, eachCountryState) {
                final CoronaCountry coronaCountry = state.countries.firstWhere(
                    (country) => country.countryInfo.id == eachCountryState);
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Case Updated\n",
                                  style: kTitleTextstyle,
                                ),
                                TextSpan(
                                  text:
                                      "Newest Update on ${helper.miliSecondsToDate(coronaCountry.updated)}",
                                  style: kSubTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          BlocBuilder<CoronaeachcountryBloc, num>(
                              builder: (context, eachCountryState) {
                            final CoronaCountry coronaCountry = state.countries
                                .firstWhere((country) =>
                                    country.countryInfo.id == eachCountryState);
                            return InkWell(
                              child: Text(
                                "See Details",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              onTap: () {
                                bottomSheetLoginPage(
                                    context,
                                    DetailsCountryPage(
                                      country: coronaCountry,
                                    ));
                              },
                            );
                          }),
                        ],
                      ),
                      SizedBox(height: 20),
                      BlocBuilder<CoronaeachcountryBloc, num>(
                          builder: (context, eachCountryState) {
                        final CoronaCountry coronaCountry = state.countries
                            .firstWhere((country) =>
                                country.countryInfo.id == eachCountryState);
                        return Container(
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
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: CounterCase(
                                  color: kInfectedColor,
                                  number: coronaCountry.active,
                                  text: "Active Cases",
                                ),
                              ),
                              Expanded(
                                child: CounterCase(
                                  color: kDeathColor,
                                  number: coronaCountry.deaths,
                                  text: "Deaths",
                                ),
                              ),
                              Expanded(
                                child: CounterCase(
                                  color: kRecovercolor,
                                  number: coronaCountry.recovered,
                                  text: "Recovered",
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Text("Get to know COVID-19", style: kTitleTextstyle),
                          Spacer(),
                          InkWell(
                            child: Text(
                              "See Details",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(mainRoute.symptons);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SymptonCard(
                            image: 'assets/images/virus_new.png',
                            text: 'Symptoms',
                          ),
                          Spacer(),
                          SymptonCard(
                            image: 'assets/images/map.png',
                            text: 'Virus Distribution',
                          ),
                          Spacer(),
                          SymptonCard(
                            image: 'assets/images/mask_protection.png',
                            text: 'Preventions',
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        );
      } else {
        return Container(
          height: 0,
          width: 0,
        );
      }
    });
  }
}

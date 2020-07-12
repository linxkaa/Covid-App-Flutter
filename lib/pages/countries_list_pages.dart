import 'package:covid_app/blocs/CoronaEachCountry/coronaeachcountry_bloc.dart';
import 'package:covid_app/blocs/FilteredCountriesBloc/filteredcountries_bloc.dart';

import 'package:covid_app/data/models/corona_countries.dart';
import 'package:covid_app/pages/error_page.dart';
import 'package:covid_app/pages/loading_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesList extends StatefulWidget {
  CountriesList({Key key}) : super(key: key);

  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  double scrHeight, scrWidth;
  bool isSearching = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topRight,
        //       end: Alignment.topLeft,
        //       colors: <Color>[Colors.blue[300], Color(0xFF11249F)],
        //     ),
        //   ),
        // ),
        backgroundColor: Colors.white,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue[400],
          ),
          onTap: () {
            BlocProvider.of<FilteredcountriesBloc>(context)
                .add(BtnClearFilteredEvent());
            Navigator.of(context).pop();
          },
        ),
        title: !isSearching
            ? Text(
                "Pick Countries",
                style: TextStyle(
                    fontFamily: "RussoOne",
                    letterSpacing: 1.7,
                    color: Colors.blue[400]),
              )
            : TextFormField(
                controller: controller,
                autofocus: true,
                style: TextStyle(color: Colors.blue[400]),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: Colors.blue[400],
                  ),
                  hintText: "Search by Country",
                  hintStyle: TextStyle(color: Colors.blue[400]),
                ),
                onChanged: (value) {
                  BlocProvider.of<FilteredcountriesBloc>(context).add(
                    FilteredCountriesListEvent(typeToFilter: value),
                  );
                },
              ),
        centerTitle: true,
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.blue[400]),
                  onPressed: () {
                    BlocProvider.of<FilteredcountriesBloc>(context)
                        .add(BtnClearFilteredEvent());
                    setState(() {
                      controller.text = " ";
                      isSearching = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search, color: Colors.blue[400]),
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: BlocBuilder<FilteredcountriesBloc, FilteredCountriesState>(
        builder: (context, state) {
          if (state is FilteredCountriesILoadingState) {
            return LoadingPage();
          } else if (state is FilteredCountriesISuccessState) {
            return buildCoronaCountriesList(state.countries);
          } else if (state is FilteredCoronaCountriesFailureState) {
            return Scaffold(
              body: Center(
                child: Text(state.message),
              ),
            );
          } else if (state is NoCountriesFoundState) {
            return buildErrorUI('No countries Found');
          } else {
            return Container(height: 0, width: 0);
          }
        },
      ),
    );
  }
}

Widget buildCoronaCountriesList(List<CoronaCountry> countries) {
  return Container(
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: countries.length,
      itemBuilder: (context, position) {
        CoronaCountry coronaCountry = countries[position];
        return Material(
          child: InkWell(
            onTap: () {
              BlocProvider.of<CoronaeachcountryBloc>(context)
                  .add(CoronaeachcountryEvent(coronaCountry.countryInfo.id));
              BlocProvider.of<FilteredcountriesBloc>(context)
                  .add(BtnClearFilteredEvent());
              Navigator.of(context).pop();
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                  height: 70,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // CircleAvatar(
                      //     backgroundColor: Colors.white,
                      //     radius: 20,
                      //     backgroundImage: NetworkImage(
                      //       coronaCountry.countryInfo.flag,
                      //     )),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(100.0),
                          child: Image.network(coronaCountry.countryInfo.flag,
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            coronaCountry.country.toUpperCase(),
                            style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: "RussoOne",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 40),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Total Cases : ${coronaCountry.cases.toString()}",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        );
      },
    ),
  );
}

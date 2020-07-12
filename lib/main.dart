import 'package:covid_app/blocs/CoronaCountriesBloc_/coronacountries_bloc.dart';
import 'package:covid_app/blocs/CoronaEachCountry/coronaeachcountry_bloc.dart';
import 'package:covid_app/data/datasources/corona_data_sources.dart';
import 'package:covid_app/data/repos/corona_repo.dart';
import 'package:covid_app/route.dart';
import 'package:covid_app/widget/constant.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CoronaRepository coronaRepository =
      CoronaRepository(coronaDataSource: CoronaDataSource());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoronaCountriesBloc>(
          create: (context) =>
              CoronaCountriesBloc(coronaRepository: coronaRepository),
        ),
        BlocProvider<CoronaeachcountryBloc>(
          create: (context) => CoronaeachcountryBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid App',
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            bodyText2: TextStyle(color: kBodyTextColor),
          ),
        ),
        routes: mainRoute.routeList,
      ),
    );
  }
}

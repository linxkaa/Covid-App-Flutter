import 'package:covid_app/blocs/CoronaCountriesBloc_/coronacountries_bloc.dart';
import 'package:covid_app/blocs/FilteredCountriesBloc/filteredcountries_bloc.dart';
import 'package:covid_app/data/datasources/corona_data_sources.dart';
import 'package:covid_app/data/repos/corona_repo.dart';
import 'package:covid_app/pages/countries_list_pages.dart';
import 'package:covid_app/pages/home_page.dart';
import 'package:covid_app/pages/loading_page.dart';
import 'package:covid_app/pages/symptons_details_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _Route {
  final String main = "/";
  final String countries = "countries";
  final String symptons = "symptons";
  final String loading = "loading";
  Map<String, WidgetBuilder> get routeList {
    return {
      main: (context) => BlocProvider<FilteredcountriesBloc>(
          create: (context) => FilteredcountriesBloc(
                coronaRepository:
                    CoronaRepository(coronaDataSource: CoronaDataSource()),
                coronaCountriesBloc:
                    BlocProvider.of<CoronaCountriesBloc>(context),
              ),
          child: HomePage()),
      countries: (context) => BlocProvider<FilteredcountriesBloc>(
            create: (context) => FilteredcountriesBloc(
              coronaRepository:
                  CoronaRepository(coronaDataSource: CoronaDataSource()),
              coronaCountriesBloc:
                  BlocProvider.of<CoronaCountriesBloc>(context),
            ),
            child: CountriesList(),
          ),
      symptons: (context) => SymptonsDetailedPage(),
      loading: (context) => LoadingPage()
    };
  }
}

final _Route mainRoute = _Route();

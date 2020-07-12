import 'package:covid_app/data/datasources/corona_data_sources.dart';
import 'package:covid_app/data/models/corona_countries.dart';
import 'package:flutter/material.dart';

class CoronaRepository {
  CoronaDataSource coronaDataSource;

  CoronaRepository({@required this.coronaDataSource});

  Future<List<CoronaCountry>> fetchCoronaCountries() async {
    return await coronaDataSource.getCoronaCountries();
  }

  List<CoronaCountry> fetchFilteredCountries(
      String text, List<CoronaCountry> list) {
    return coronaDataSource.getFilteredCountries(text, list);
  }
}

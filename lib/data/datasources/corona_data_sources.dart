import 'package:covid_app/data/models/corona_countries.dart';
import 'package:covid_app/resources/strings/app_strings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CoronaDataSource {
  Future<List<CoronaCountry>> getCoronaCountries() async {
    var response = await http.get(AppString.coronaCountriesURL);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<CoronaCountry> coronaCountry =
          CoronaCountryList.fromJson(data).countries;
      return coronaCountry;
    } else {
      throw Exception();
    }
  }

  List<CoronaCountry> getFilteredCountries(
      String text, List<CoronaCountry> countries) {
    List<CoronaCountry> newList = List.from(countries);
    if (countries.length == 0) {
      return [];
    } else {
      newList = countries
          .where(
            (i) => i.country.toLowerCase().contains(text.trim().toLowerCase()),
          )
          .toList(); // text trim buat nge remove white space di text
      return newList;
    }
  }
}

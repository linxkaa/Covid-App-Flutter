// To parse this JSON data, do
//
//     final coronaCountry = coronaCountryFromJson(jsonString);

import 'dart:convert';

class CoronaCountryList {
  List<CoronaCountry> countries;

  CoronaCountryList({this.countries});

  CoronaCountryList.fromJson(List<dynamic> parsedJson) {
    if (parsedJson != null) {
      countries = List<CoronaCountry>();
      countries = parsedJson.map((i) => CoronaCountry.fromJson(i)).toList();
    }
  }
}

// To parse this JSON data, do
//
//     final coronaCountry = coronaCountryFromJson(jsonString);

class CoronaCountry {
  CoronaCountry({
    this.updated,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });

  final num updated;
  final String country;
  final CountryInfo countryInfo;
  final num cases;
  final num todayCases;
  final num deaths;
  final num todayDeaths;
  final num recovered;
  final num todayRecovered;
  final num active;
  final num critical;
  final num casesPerOneMillion;
  final num deathsPerOneMillion;
  final num tests;
  final num testsPerOneMillion;
  final num population;
  final String continent;
  final num oneCasePerPeople;
  final num oneDeathPerPeople;
  final num oneTestPerPeople;
  final num activePerOneMillion;
  final num recoveredPerOneMillion;
  final num criticalPerOneMillion;

  CoronaCountry copyWith({
    num updated,
    String country,
    CountryInfo countryInfo,
    num cases,
    num todayCases,
    num deaths,
    num todayDeaths,
    num recovered,
    num todayRecovered,
    num active,
    num critical,
    num casesPerOneMillion,
    num deathsPerOneMillion,
    num tests,
    num testsPerOneMillion,
    num population,
    String continent,
    num oneCasePerPeople,
    num oneDeathPerPeople,
    num oneTestPerPeople,
    num activePerOneMillion,
    num recoveredPerOneMillion,
    num criticalPerOneMillion,
  }) =>
      CoronaCountry(
        updated: updated ?? this.updated,
        country: country ?? this.country,
        countryInfo: countryInfo ?? this.countryInfo,
        cases: cases ?? this.cases,
        todayCases: todayCases ?? this.todayCases,
        deaths: deaths ?? this.deaths,
        todayDeaths: todayDeaths ?? this.todayDeaths,
        recovered: recovered ?? this.recovered,
        todayRecovered: todayRecovered ?? this.todayRecovered,
        active: active ?? this.active,
        critical: critical ?? this.critical,
        casesPerOneMillion: casesPerOneMillion ?? this.casesPerOneMillion,
        deathsPerOneMillion: deathsPerOneMillion ?? this.deathsPerOneMillion,
        tests: tests ?? this.tests,
        testsPerOneMillion: testsPerOneMillion ?? this.testsPerOneMillion,
        population: population ?? this.population,
        continent: continent ?? this.continent,
        oneCasePerPeople: oneCasePerPeople ?? this.oneCasePerPeople,
        oneDeathPerPeople: oneDeathPerPeople ?? this.oneDeathPerPeople,
        oneTestPerPeople: oneTestPerPeople ?? this.oneTestPerPeople,
        activePerOneMillion: activePerOneMillion ?? this.activePerOneMillion,
        recoveredPerOneMillion:
            recoveredPerOneMillion ?? this.recoveredPerOneMillion,
        criticalPerOneMillion:
            criticalPerOneMillion ?? this.criticalPerOneMillion,
      );

  factory CoronaCountry.fromRawJson(String str) =>
      CoronaCountry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CoronaCountry.fromJson(Map<String, dynamic> json) => CoronaCountry(
        updated: json["updated"] == null ? null : json["updated"],
        country: json["country"] == null ? null : json["country"],
        countryInfo: json["countryInfo"] == null
            ? null
            : CountryInfo.fromJson(json["countryInfo"]),
        cases: json["cases"] == null ? null : json["cases"],
        todayCases: json["todayCases"] == null ? null : json["todayCases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        todayDeaths: json["todayDeaths"] == null ? null : json["todayDeaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        todayRecovered:
            json["todayRecovered"] == null ? null : json["todayRecovered"],
        active: json["active"] == null ? null : json["active"],
        critical: json["critical"] == null ? null : json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"] == null
            ? null
            : json["casesPerOneMillion"],
        deathsPerOneMillion: json["deathsPerOneMillion"] == null
            ? null
            : json["deathsPerOneMillion"],
        tests: json["tests"] == null ? null : json["tests"],
        testsPerOneMillion: json["testsPerOneMillion"] == null
            ? null
            : json["testsPerOneMillion"],
        population: json["population"] == null ? null : json["population"],
        continent: json["continent"] == null ? null : json["continent"],
        oneCasePerPeople:
            json["oneCasePerPeople"] == null ? null : json["oneCasePerPeople"],
        oneDeathPerPeople: json["oneDeathPerPeople"] == null
            ? null
            : json["oneDeathPerPeople"],
        oneTestPerPeople:
            json["oneTestPerPeople"] == null ? null : json["oneTestPerPeople"],
        activePerOneMillion: json["activePerOneMillion"] == null
            ? null
            : json["activePerOneMillion"].toDouble(),
        recoveredPerOneMillion: json["recoveredPerOneMillion"] == null
            ? null
            : json["recoveredPerOneMillion"].toDouble(),
        criticalPerOneMillion: json["criticalPerOneMillion"] == null
            ? null
            : json["criticalPerOneMillion"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "updated": updated == null ? null : updated,
        "country": country == null ? null : country,
        "countryInfo": countryInfo == null ? null : countryInfo.toJson(),
        "cases": cases == null ? null : cases,
        "todayCases": todayCases == null ? null : todayCases,
        "deaths": deaths == null ? null : deaths,
        "todayDeaths": todayDeaths == null ? null : todayDeaths,
        "recovered": recovered == null ? null : recovered,
        "todayRecovered": todayRecovered == null ? null : todayRecovered,
        "active": active == null ? null : active,
        "critical": critical == null ? null : critical,
        "casesPerOneMillion":
            casesPerOneMillion == null ? null : casesPerOneMillion,
        "deathsPerOneMillion":
            deathsPerOneMillion == null ? null : deathsPerOneMillion,
        "tests": tests == null ? null : tests,
        "testsPerOneMillion":
            testsPerOneMillion == null ? null : testsPerOneMillion,
        "population": population == null ? null : population,
        "continent": continent == null ? null : continent,
        "oneCasePerPeople": oneCasePerPeople == null ? null : oneCasePerPeople,
        "oneDeathPerPeople":
            oneDeathPerPeople == null ? null : oneDeathPerPeople,
        "oneTestPerPeople": oneTestPerPeople == null ? null : oneTestPerPeople,
        "activePerOneMillion":
            activePerOneMillion == null ? null : activePerOneMillion,
        "recoveredPerOneMillion":
            recoveredPerOneMillion == null ? null : recoveredPerOneMillion,
        "criticalPerOneMillion":
            criticalPerOneMillion == null ? null : criticalPerOneMillion,
      };
}

class CountryInfo {
  CountryInfo({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  final num id;
  final String iso2;
  final String iso3;
  final num lat;
  final num long;
  final String flag;

  CountryInfo copyWith({
    num id,
    String iso2,
    String iso3,
    num lat,
    num long,
    String flag,
  }) =>
      CountryInfo(
        id: id ?? this.id,
        iso2: iso2 ?? this.iso2,
        iso3: iso3 ?? this.iso3,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        flag: flag ?? this.flag,
      );

  factory CountryInfo.fromRawJson(String str) =>
      CountryInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        id: json["_id"] == null ? null : json["_id"],
        iso2: json["iso2"] == null ? null : json["iso2"],
        iso3: json["iso3"] == null ? null : json["iso3"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        long: json["long"] == null ? null : json["long"].toDouble(),
        flag: json["flag"] == null ? null : json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "iso2": iso2 == null ? null : iso2,
        "iso3": iso3 == null ? null : iso3,
        "lat": lat == null ? null : lat,
        "long": long == null ? null : long,
        "flag": flag == null ? null : flag,
      };
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_app/data/models/corona_countries.dart';
import 'package:covid_app/data/repos/corona_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'coronacountries_event.dart';
part 'coronacountries_state.dart';

class CoronaCountriesBloc
    extends Bloc<CoronaCountriesEvent, CoronaCountriesState> {
  CoronaRepository coronaRepository;

  CoronaCountriesBloc({@required this.coronaRepository}) {
    add(FetchingDataCountriesEvent());
  }

  @override
  CoronaCountriesState get initialState => CoronaCountriesLoadingState();

  @override
  Stream<CoronaCountriesState> mapEventToState(
    CoronaCountriesEvent event,
  ) async* {
    if (event is FetchingDataCountriesEvent) {
      yield* mapFetchCoronaCountries(event);
    }
  }

  Stream<CoronaCountriesState> mapFetchCoronaCountries(
    CoronaCountriesEvent event,
  ) async* {
    yield CoronaCountriesLoadingState();
    try {
      List<CoronaCountry> countries =
          await coronaRepository.fetchCoronaCountries();
      yield CoronaCountriesSuccessState(countries: countries);
    } catch (e) {
      print(e);
      yield CoronaCountriesFailureState(message: e.toString());
    }
  }
}

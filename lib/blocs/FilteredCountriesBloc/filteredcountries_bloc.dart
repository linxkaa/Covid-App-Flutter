import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:covid_app/blocs/CoronaCountriesBloc_/coronacountries_bloc.dart';
import 'package:covid_app/data/repos/corona_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:covid_app/data/models/corona_countries.dart';
import 'package:flutter/cupertino.dart';

part 'filteredcountries_event.dart';
part 'filteredcountries_state.dart';

class FilteredcountriesBloc
    extends Bloc<FilteredCountriesEvent, FilteredCountriesState> {
  final CoronaCountriesBloc coronaCountriesBloc;
  StreamSubscription countriesSubscription;
  List<CoronaCountry> fetchedCountriees;
  CoronaRepository coronaRepository;
  List<CoronaCountry> countriesFound = [];
  String message;

  FilteredcountriesBloc(
      {@required this.coronaCountriesBloc, @required this.coronaRepository}) {
    countriesSubscription = coronaCountriesBloc.listen(
      (state) {
        if (state is CoronaCountriesSuccessState) {
          add(
            FilteredUpdatedCountriesEvent(
                countriesFetched:
                    (coronaCountriesBloc.state as CoronaCountriesSuccessState)
                        .countries),
          );
        } else if (state is CoronaCountriesFailureState) {
          message = ((coronaCountriesBloc.state as CoronaCountriesFailureState)
              .message);
          add(FailureFromCountriesEvent(
              (coronaCountriesBloc.state as CoronaCountriesFailureState)
                  .message));
        }
      },
    );
  }

  @override
  FilteredCountriesState get initialState {
    if (coronaCountriesBloc.state is CoronaCountriesSuccessState) {
      return FilteredCountriesISuccessState(
          countries: (coronaCountriesBloc.state as CoronaCountriesSuccessState)
              .countries);
    } else {
      return FilteredCountriesILoadingState();
    }
  }

  @override
  Stream<FilteredCountriesState> mapEventToState(
    FilteredCountriesEvent event,
  ) async* {
    if (event is FilteredUpdatedCountriesEvent) {
      fetchedCountriees = event.countriesFetched;
      yield FilteredCountriesISuccessState(countries: event.countriesFetched);
    } else if (event is FilteredCountriesListEvent) {
      yield* mapFetchFilteredCountries(event);
    } else if (event is BtnClearFilteredEvent) {
      yield FilteredCountriesISuccessState(countries: fetchedCountriees);
    } else if (event is FailureFromCountriesEvent) {
      yield FilteredCoronaCountriesFailureState(message: message);
    }
  }

  Stream<FilteredCountriesState> mapFetchFilteredCountries(
    FilteredCountriesListEvent event,
  ) async* {
    yield FilteredCountriesILoadingState();
    countriesFound = coronaRepository.fetchFilteredCountries(
        event.typeToFilter, fetchedCountriees);
    if (countriesFound.length > 0) {
      yield FilteredCountriesISuccessState(countries: countriesFound);
    } else {
      yield NoCountriesFoundState();
    }
  }

  @override
  Future<void> close() {
    countriesSubscription.cancel();
    return super.close();
  }
}

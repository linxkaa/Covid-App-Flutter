part of 'filteredcountries_bloc.dart';

abstract class FilteredCountriesState extends Equatable {
  const FilteredCountriesState();
  @override
  List<Object> get props => [];
}

class FilteredCountriesILoadingState extends FilteredCountriesState {}

class FilteredCountriesISuccessState extends FilteredCountriesState {
  final List<CoronaCountry> countries;

  FilteredCountriesISuccessState({@required this.countries});

  @override
  List<Object> get props => [countries];
}

class FilteredCoronaCountriesFailureState extends FilteredCountriesState {
  final String message;

  FilteredCoronaCountriesFailureState({this.message});

  @override
  List<Object> get props => [message];
}

class NoCountriesFoundState extends FilteredCountriesState {}

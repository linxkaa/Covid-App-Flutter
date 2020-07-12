part of 'coronacountries_bloc.dart';

abstract class CoronaCountriesState extends Equatable {
  const CoronaCountriesState();
  @override
  List<Object> get props => [];
}

class CoronaCountriesLoadingState extends CoronaCountriesState {}

class CoronaCountriesSuccessState extends CoronaCountriesState {
  final List<CoronaCountry> countries;

  CoronaCountriesSuccessState({@required this.countries});

  @override
  List<Object> get props => [countries];
}

class CoronaCountriesFailureState extends CoronaCountriesState {
  final String message;

  CoronaCountriesFailureState({this.message});

  @override
  List<Object> get props => [message];
}

part of 'coronacountries_bloc.dart';

abstract class CoronaCountriesEvent extends Equatable {
  const CoronaCountriesEvent();
  @override
  List<Object> get props => [];
}

class FetchingDataCountriesEvent extends CoronaCountriesEvent {}

class DetailedCountryEvent extends CoronaCountriesEvent {
  final String country;

  DetailedCountryEvent({@required this.country});

  @override
  List<Object> get props => [country];
}

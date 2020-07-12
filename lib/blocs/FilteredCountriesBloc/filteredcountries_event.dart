part of 'filteredcountries_bloc.dart';

abstract class FilteredCountriesEvent extends Equatable {
  const FilteredCountriesEvent();

  @override
  List<Object> get props => [];
}

class FilteredCountriesListEvent extends FilteredCountriesEvent {
  final String typeToFilter;

  FilteredCountriesListEvent({@required this.typeToFilter});

  @override
  List<Object> get props => [typeToFilter];
}

class FilteredUpdatedCountriesEvent extends FilteredCountriesEvent {
  final List<CoronaCountry> countriesFetched;

  FilteredUpdatedCountriesEvent({@required this.countriesFetched});

  @override
  List<Object> get props => [countriesFetched];
}

class FailureFromCountriesEvent extends FilteredCountriesEvent {
  final String message;
  FailureFromCountriesEvent(this.message);

  @override
  List<Object> get props => [message];
}

class BtnClearFilteredEvent extends FilteredCountriesEvent {}

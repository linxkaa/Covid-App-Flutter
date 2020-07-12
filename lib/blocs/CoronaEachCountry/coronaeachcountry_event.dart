part of 'coronaeachcountry_bloc.dart';

class CoronaeachcountryEvent extends Equatable {
  final num id;

  CoronaeachcountryEvent(this.id);
  @override
  List<Object> get props => [id];
}

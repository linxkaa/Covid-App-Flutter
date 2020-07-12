import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'coronaeachcountry_event.dart';
part 'coronaeachcountry_state.dart';

class CoronaeachcountryBloc extends Bloc<CoronaeachcountryEvent, num> {
  @override
  num get initialState => 360;

  @override
  Stream<num> mapEventToState(
    CoronaeachcountryEvent event,
  ) async* {
    yield event.id;
  }
}

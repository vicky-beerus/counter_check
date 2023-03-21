import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counterapp/MODEL/COUNTER_MODEL/counter_model.dart';
import 'package:equatable/equatable.dart';

import '../../REPOSITORY/repositotry.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository counterRepository;
  CounterBloc({required this.counterRepository})
      : super(CounterGetState(counter: counterRepository.getCount())) {
    on(_onCounterGet);
    on(_onCounterAdd);
    on(_onCounterminus);
  }

  _onCounterGet(GetCounterEvent event, Emitter<CounterState> emit) {
    try {
      var val = counterRepository.getCount();
      emit(CounterGetState(counter: val));
    } catch (e) {
      print("er in Oncounterget : $e");
    }
  }

  _onCounterAdd(AddCountEvent event, Emitter<CounterState> emit) {
    if (state is CounterGetState) {
      try {
        final val = counterRepository.addCount();
        emit(CounterGetState(counter: val));
      } catch (e) {
        emit(CounterErrorState(er_msg: e.toString()));
      }
    }
  }

  _onCounterminus(MinusCountEvent event, Emitter<CounterState> emit) {
    if (state is CounterGetState) {
      try {
        final val = counterRepository.minusCount();
        emit(CounterGetState(counter: val));
      } catch (e) {
        emit(CounterErrorState(er_msg: e.toString()));
      }
    }
  }
}

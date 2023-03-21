part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterGetState extends CounterState {
  late CounterModel counter;

  CounterGetState({required this.counter});

  @override
  List<Object> get props => [this.counter];
}



class CounterAddState extends CounterState{
  late CounterModel count;


  CounterAddState({required this.count});

  @override

  List<Object?> get props => [this.count];
}
class CounterMinustate extends CounterState{
  late CounterModel count;


  CounterMinustate({required this.count});

  @override

  List<Object?> get props => [this.count];
}
class CounterErrorState extends CounterState{
  String? er_msg;

  CounterErrorState({this.er_msg});

  @override

  List<Object?> get props =>[er_msg];
}

part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}


class GetCounterEvent extends CounterEvent{

  @override

  List<Object?> get props => [];
}


class AddCountEvent extends CounterEvent{

  late CounterModel count;


  AddCountEvent({required this.count});

  @override

  List<Object?> get props => [this.count];
}


class MinusCountEvent extends CounterEvent{

  late CounterModel count;


  MinusCountEvent({required this.count});

  @override

  List<Object?> get props => [this.count];
}

class CountErrorEvent extends CounterEvent{
  String? er_msg;

  CountErrorEvent({this.er_msg});

  @override

  List<Object?> get props => [er_msg];
}
import 'package:counterapp/MODEL/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterRepository {
  int count = 0;
  CounterModel getCount() => CounterModel(count: count);

  CounterModel addCount() => CounterModel(count: count += 1);

  CounterModel minusCount() => CounterModel(count: count -= 1);
}

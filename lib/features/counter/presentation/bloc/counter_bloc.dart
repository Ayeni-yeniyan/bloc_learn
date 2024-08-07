import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncremented>((event, emit) {
      emit(state + 1);
      print('Increment emitted');
    });
    on<CounterDecremented>((event, emit) {
      emit(state - 1);
      print('Decrement emitted');
    });
  }
}

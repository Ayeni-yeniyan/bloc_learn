import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<TodoModel> data = [];
  TodoBloc() : super(TodoInitial()) {
    on<TodoAdded>((event, emit) async {
      emit(TodoStateLoading());
      await Future.delayed(const Duration(seconds: 3), () {});
      if (event.data.isEmpty) {
        return emit(TodoStateError());
      }

      final todo = TodoModel(name: event.data, createdAt: DateTime.now());
      data.add(todo);
      emit(TodoStateCompleted(data));
    });
  }
}

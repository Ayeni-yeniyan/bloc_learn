import 'package:bloc_learn/features/Todo/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String text) {
    final todo = TodoModel(name: text, createdAt: DateTime.now());
    print('Before: ${state.length}');
    // state.add(todo);
    emit(state + [todo]);
    print('After: ${state.length}');
  }

  @override
  void onChange(Change<List<TodoModel>> change) {
    print(change);
    super.onChange(change);
  }
}

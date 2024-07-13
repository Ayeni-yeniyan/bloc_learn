part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodoStateLoading extends TodoState {}

final class TodoStateError extends TodoState {}

final class TodoStateCompleted extends TodoState {
  TodoStateCompleted(this.data);
  final List<TodoModel> data;
}

part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class TodoAdded extends TodoEvent {
  final String data;
  TodoAdded(this.data);
}

final class TodoRemoved extends TodoEvent {}

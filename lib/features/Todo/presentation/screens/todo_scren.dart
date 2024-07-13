import 'package:bloc_learn/features/Todo/presentation/bloc/todo_bloc.dart';
import 'package:bloc_learn/features/Todo/presentation/screens/add_todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const TodoScreen(),
      );
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Todo List'),
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is TodoStateError) {
            if (context.mounted) {
              Navigator.pop(context);
            }
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Failed to add Todo as the title is null')));
          }
          if (state is TodoStateCompleted) {
            if (context.mounted) {
              Navigator.pop(context);
            }
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added a new Todo!')));
          }
          if (state is TodoStateLoading) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
        },
        builder: (context, todos) {
          if (todos is TodoStateCompleted) {
            return ListView.builder(
              itemCount: todos.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos.data[index].name),
                  subtitle: Text(todos.data[index].createdAt.toIso8601String()),
                );
              },
            );
          }
          return const Text('Add Todos');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, AddTodoScreen.route()),
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}

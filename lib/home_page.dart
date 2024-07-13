import 'package:bloc_learn/features/Todo/presentation/screens/todo_scren.dart';
import 'package:bloc_learn/features/counter/presentation/screens/counter_screen.dart';
import 'package:flutter/material.dart';

import 'features/weather/presentation/screens/weather_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, CounterScreen.route()),
              child: const Text('Counter Feature'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, TodoScreen.route()),
              child: const Text('Todo Feature'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, WeatherScreen.route()),
              child: const Text('Weather Feature'),
            ),
          ],
        ),
      ),
    );
  }
}

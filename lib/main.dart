import 'package:bloc_learn/app_bloc_observer.dart';
import 'package:bloc_learn/features/Todo/presentation/bloc/todo_bloc.dart';
import 'package:bloc_learn/features/Todo/presentation/cubit/todo_cubit.dart';
import 'package:bloc_learn/features/weather/data_repo/weather_repo.dart';
import 'package:bloc_learn/features/weather/data_scource/data_source.dart';
import 'package:bloc_learn/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:bloc_learn/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/counter/presentation/bloc/counter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepo(DataSource()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterBloc()),
          BlocProvider(create: (context) => TodoCubit()),
          BlocProvider(create: (context) => TodoBloc()),
          BlocProvider(
              create: (context) => WeatherBloc(context.read<WeatherRepo>())),
        ],
        child: MaterialApp(
          title: 'Flutter Bloc',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}

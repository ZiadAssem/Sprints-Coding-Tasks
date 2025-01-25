import 'package:different_bloc/presentation/bloc/counter/counter_cubit.dart';
import 'package:different_bloc/presentation/bloc/theme/theme_cubit.dart';
import 'package:different_bloc/presentation/screens/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_) => ThemeCubit()),
      BlocProvider(create: (_) => CounterCubit())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, themeData) {
        return MaterialApp(
            title: 'Flutter Demo', theme: themeData, home: const CounterPage());
      },
    );
  }
}

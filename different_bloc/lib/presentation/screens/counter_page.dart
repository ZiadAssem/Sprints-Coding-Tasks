import 'package:different_bloc/presentation/bloc/counter/counter_cubit.dart';
import 'package:different_bloc/presentation/bloc/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme and Counter Bloc (Cubits)'),
      ),
      body: Center(
        child: BlocConsumer<CounterCubit, int>(
          builder: (context, counterValue) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Counter Value: $counterValue',
                    style: TextStyle(fontSize: 24)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => context.read<CounterCubit>().increment(),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () => context.read<CounterCubit>().decrement(),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                      child: Text('Toggle Theme'),
                    ),
                  ],
                ),
              ],
            );
          },
          listener: (context, counterValue) {
            if (counterValue == 5) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Counter reached 5!')),
              );
            }
          },
        ),
      ),
    );
  }
}

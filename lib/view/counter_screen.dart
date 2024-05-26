import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_bloc_example/bloc/counter_bloc/counter_event.dart';

import '../bloc/counter_bloc/counter_bloc.dart';
import '../bloc/counter_bloc/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
      ]),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounter());
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(IncrementCounter());
              },
              child: const Icon(Icons.add))
        ],
      ),
    );
  }
}

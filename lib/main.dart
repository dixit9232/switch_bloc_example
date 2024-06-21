import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_bloc_example/bloc/counter_bloc/counter_bloc.dart';
import 'package:switch_bloc_example/bloc/switch_bloc/switch_state.dart';
import 'package:switch_bloc_example/view/switch_and_container.dart';

import 'bloc/counter_bloc/counter_state.dart';
import 'bloc/switch_bloc/switch_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(const CounterState()),
        ),
        BlocProvider(
          create: (_) => SwitchBloc(const SwitchState()),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: SwitchAndContainer(),
      ),
    );
  }
}

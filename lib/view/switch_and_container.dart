import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_bloc_example/bloc/switch_bloc/switch_event.dart';
import 'package:switch_bloc_example/utils/print_function.dart';

import '../bloc/switch_bloc/switch_bloc.dart';
import '../bloc/switch_bloc/switch_state.dart';

class SwitchAndContainer extends StatelessWidget {
  const SwitchAndContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch and Container Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notification"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    cp("Switch Rebuild");
                    return Switch(
                      value: state.isSwitch,
                      onChanged: (bool value) {
                        context.read<SwitchBloc>().add(EnableOrDisableSwitch());
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.slider != current.slider,
              builder: (context, state) {
                cp("Container Rebuild");
                return Container(
                  height: 200,
                  decoration: BoxDecoration(color: Colors.red.withOpacity(state.slider)),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.slider != current.slider,
              builder: (context, state) {
                cp("Slider Rebuild");
                return Slider(
                  value: state.slider,
                  onChanged: (double value) {
                    context.read<SwitchBloc>().add(SliderValue(slider: value));
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

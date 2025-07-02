import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/switch_example/switch_bloc.dart';
import '../../bloc/switch_example/switch_event.dart';
import '../../bloc/switch_example/switch_state.dart';

class SwitchExampleScreen extends StatelessWidget {
  const SwitchExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch Example')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous,current)=>previous.isSwitch!= current.isSwitch,
              builder: (context, state) {
                return SwitchListTile(
                  title: const Text('Enable Notifications'),
                  value: state.isSwitch,
                  onChanged: (newValue) {
                    context.read<SwitchBloc>().add(
                      EnableOrDisableNotification(),
                    );
                  },
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(

              buildWhen: (previous,current)=>previous.slider!= current.slider,
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous,current)=>previous.slider!= current.slider,
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    print(value);
                    context.read<SwitchBloc>().add(
                      SliderEvent(slider: value),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

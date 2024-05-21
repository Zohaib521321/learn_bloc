import 'package:bloc_learn/bloc/slider_example/slider_block.dart';
import 'package:bloc_learn/bloc/slider_example/slider_event.dart';
import 'package:bloc_learn/bloc/slider_example/slider_state.dart';
import 'package:bloc_learn/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_learn/bloc/switch_example/switch_event.dart';
import 'package:bloc_learn/bloc/switch_example/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example 4"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              print("Switch Build");
              return Switch(
                  value: state.change,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(OnChangeSwitch());
                  });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              print("Change Build");
              return Text(
                state.change ? "1" : "0",
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<SliderBloc, SliderState>(
              builder: (context, state) {
                print("Container Build");
                return Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.red.withOpacity(state.value),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<SliderBloc, SliderState>(
            // buildWhen: (previous, current) => previous.value != current.value,
            builder: (context, state) {
              return Slider(
                  value: state.value,
                  onChanged: (newValue) {
                    context
                        .read<SliderBloc>()
                        .add(ChangeSlider(value: newValue));
                  });
            },
          )
        ],
      ),
    );
  }
}

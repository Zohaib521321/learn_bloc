import 'package:bloc_learn/bloc/counter/counter_bloc.dart';
import 'package:bloc_learn/bloc/counter/counter_event.dart';
import 'package:bloc_learn/bloc/counter/counter_state.dart';
import 'package:bloc_learn/ui/favorite.dart';
import 'package:bloc_learn/ui/hide_text.dart';
import 'package:bloc_learn/ui/image_picker_ui.dart';
import 'package:bloc_learn/ui/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Couter App"),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Center(
                  child: Text(
                    state.counter.toString(),
                    style: const TextStyle(fontSize: 60),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementEvent());
                    },
                    child: const Text("Add")),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementEvent());
                    },
                    child: const Text("Remove"))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HideText()));
                },
                child: const Text("Hide and show")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Favorite()));
                },
                child: const Text("Favorite")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SwitchExample()));
                },
                child: const Text("Switch")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ImagePickerUi()));
                },
                child: const Text("Image Picker")),
          ],
        ),
      ),
    );
  }
}

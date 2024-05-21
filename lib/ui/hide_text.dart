import 'package:bloc_learn/bloc/hide/hide_bloc.dart';
import 'package:bloc_learn/bloc/hide/hide_event.dart';
import 'package:bloc_learn/bloc/hide/hide_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HideText extends StatefulWidget {
  const HideText({super.key});

  @override
  State<HideText> createState() => _HideTextState();
}

class _HideTextState extends State<HideText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hide Text"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocBuilder<HideBloc, HideState>(
            builder: (context, state) {
              return Text(state.show ? "Show" : "Hide");
            },
          ),
          ElevatedButton(
              onPressed: () {
                context.read<HideBloc>().add(Hide());
              },
              child: Text("Hide"))
        ],
      ),
    );
  }
}

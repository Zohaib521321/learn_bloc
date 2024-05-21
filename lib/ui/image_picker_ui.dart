import 'dart:io';

import 'package:bloc_learn/bloc/image_picker_example/picker_bloc.dart';
import 'package:bloc_learn/bloc/image_picker_example/picker_event.dart';
import 'package:bloc_learn/bloc/image_picker_example/picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerUi extends StatefulWidget {
  const ImagePickerUi({super.key});

  @override
  State<ImagePickerUi> createState() => _ImagePickerUiState();
}

class _ImagePickerUiState extends State<ImagePickerUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Picker Ui"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            return InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(CameraCapture());
                },
                child: Center(
                  child: state.file != null
                      ? Image.file(File(state.file!.path))
                      : const Icon(Icons.camera),
                ));
          },
        ));
  }
}

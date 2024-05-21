import 'package:bloc_learn/bloc/counter/counter_bloc.dart';
import 'package:bloc_learn/bloc/favorite/favoriteBlock.dart';
import 'package:bloc_learn/bloc/get_api/post_block.dart';
import 'package:bloc_learn/bloc/hide/hide_bloc.dart';
import 'package:bloc_learn/bloc/image_picker_example/picker_bloc.dart';
import 'package:bloc_learn/bloc/slider_example/slider_block.dart';
import 'package:bloc_learn/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_learn/ui/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<FavoriteBloc>(
          create: (context) => FavoriteBloc(),
        ),
        BlocProvider<ImagePickerBloc>(
          create: (context) => ImagePickerBloc(),
        ),

        BlocProvider<HideBloc>(
          create: (context) => HideBloc(),
        ),
        BlocProvider<SwitchBloc>(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider<SliderBloc>(
          create: (context) => SliderBloc(),
        ),
        BlocProvider<PostBlock>(
          create: (context) => PostBlock(),
        ),
        // Add more BlocProviders for additional Blocs as needed
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PostsInterface(),
      ),
    );
  }
}

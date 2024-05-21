import 'package:bloc_learn/bloc/favorite/favoriteBlock.dart';
import 'package:bloc_learn/bloc/favorite/favorite_event.dart';
import 'package:bloc_learn/bloc/favorite/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favorite "),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Favorite Item"),
            Divider(),
            BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                return ListView.builder(
                    physics: ScrollPhysics(),
                    itemCount: state.favoriteItem.length,
                    shrinkWrap: true,
                    itemBuilder: (itemBuilder, index) {
                      return ListTile(
                        title: Text(state.favoriteItem[index]),
                        trailing: InkWell(
                            onTap: () {
                              context.read<FavoriteBloc>().add(Remove(index));
                            },
                            child: Icon(Icons.favorite)),
                      );
                    });
              },
            ),
            Text("Whole Items"),
            Divider(),
            ListView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (itemBuilder, index) {
                  return BlocBuilder<FavoriteBloc, FavoriteState>(
                    builder: (context, state) {
                      return ListTile(
                        title: Text("Index $index"),
                        trailing: InkWell(
                            onTap: () {
                              if (!state.isFavorite) {
                                context
                                    .read<FavoriteBloc>()
                                    .add(Add("Index $index"));
                              } else {
                                context
                                    .read<FavoriteBloc>()
                                    .add(RemoveText("Index $index"));
                              }
                            },
                            child: Icon(!state.isFavorite
                                ? Icons.favorite_border
                                : Icons.favorite)),
                      );
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}

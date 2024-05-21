import 'package:bloc_learn/bloc/get_api/post_block.dart';
import 'package:bloc_learn/bloc/get_api/post_events.dart';
import 'package:bloc_learn/bloc/get_api/post_status.dart';
import 'package:bloc_learn/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsInterface extends StatefulWidget {
  const PostsInterface({super.key});

  @override
  State<PostsInterface> createState() => _PostsInterfaceState();
}

class _PostsInterfaceState extends State<PostsInterface> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBlock>().add(FetchPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Posts Api"),
          centerTitle: true,
        ),
        body: BlocBuilder<PostBlock, PostStates>(
          builder: (context, state) {
            switch (state.postStatus) {
              case PostStatus.loading:
                return const CircularProgressIndicator();
              case PostStatus.failure:
                return Center(child: Text("error ${state.message}"));
              case PostStatus.success:
                return Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Search with id",
                      ),
                      onChanged: (filters) {
                        context
                            .read<PostBlock>()
                            .add(FilterPosts(searchString: filters));
                      },
                    ),
                    Expanded(
                      child: state.searchedText == ""
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.tempList.isEmpty
                                  ? state.postList.length
                                  : state.tempList.length,
                              itemBuilder: (itemBuilder, index) {
                                print(
                                    "Length of temp list is ${state.postList.length}/${state.tempList.length}");
                                if (state.tempList.isNotEmpty) {
                                  final data = state.tempList[index];
                                  return Card(
                                    child: Column(
                                      children: [
                                        Text(
                                          data.title ?? "",
                                          style: const TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          data.body ?? "",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  final data = state.postList[index];
                                  return Card(
                                    child: Column(
                                      children: [
                                        Text(
                                          data.title ?? "",
                                          style: const TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          data.body ?? "",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              })
                          : Center(child: Text(state.searchedText)),
                    ),
                  ],
                );
            }
          },
        ));
  }
}

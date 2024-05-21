import 'package:bloc/bloc.dart';
import 'package:bloc_learn/bloc/get_api/post_events.dart';
import 'package:bloc_learn/bloc/get_api/post_status.dart';
import 'package:bloc_learn/models/post_model.dart';
import 'package:bloc_learn/repositry/post_repositry.dart';
import 'package:bloc_learn/utils/enums.dart';

class PostBlock extends Bloc<PostEvent, PostStates> {
  List<Post> tempList = [];
  PostRepository postRepository = PostRepository();
  PostBlock() : super(const PostStates()) {
    on<FetchPosts>(fetchPostApi);
    on<FilterPosts>(_filterPost);
  }

  void _filterPost(FilterPosts event, Emitter<PostStates> emit) {
    if (event.searchString.isEmpty) {
      emit(state.copyWith(tempList: [], searchedText: ""));
    } else {
      tempList = state.postList
          .where((element) => element.title.toString() == event.searchString)
          .toList();
      if (tempList.isEmpty) {
        emit(state.copyWith(tempList: tempList, searchedText: "No data found"));
      } else {
        emit(state.copyWith(tempList: tempList, searchedText: ""));
      }
    }
  }

  void fetchPostApi(FetchPosts event, Emitter<PostStates> emit) async {
    await postRepository.fetchPostData().then((value) {
      emit(state.copyWith(
        postStatus: PostStatus.success,
        postList: value,
        message: "success",
      ));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
          postList: [], postStatus: PostStatus.failure, message: "failure"));
    });
  }
}

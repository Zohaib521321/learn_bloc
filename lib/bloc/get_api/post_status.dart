import 'package:bloc_learn/models/post_model.dart';
import 'package:bloc_learn/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostStates extends Equatable {
  final PostStatus postStatus;
  final List<Post> postList;
  final String message;
  final List<Post> tempList;
  final String searchedText;
  const PostStates(
      {this.postStatus = PostStatus.loading,
      this.postList = const [],
      this.searchedText = "",
      this.tempList = const [],
      this.message = ""});
  PostStates copyWith(
      {PostStatus? postStatus,
      List<Post>? postList,
      String? message,
      String? searchedText,
      List<Post>? tempList}) {
    return PostStates(
        postStatus: postStatus ?? this.postStatus,
        postList: postList ?? this.postList,
        tempList: tempList ?? this.tempList,
        searchedText: searchedText ?? this.searchedText,
        message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [postStatus, postList, message, tempList, searchedText];
}

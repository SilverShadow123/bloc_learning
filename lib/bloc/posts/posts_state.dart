import 'package:equatable/equatable.dart';

import '../../utils/enums.dart';
import '../model/posts_model.dart';

class PostStates extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempostList;
  final String message;
  final String searchMessage;

  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.tempostList = const <PostModel>[],
    this.message = '',
    this.searchMessage = '',
  });

  PostStates copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    List<PostModel>? tempostList,
    String? message,
    String? searchMessage,
  }) {
    return PostStates(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      tempostList: tempostList ?? this.tempostList,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postStatus, postList,tempostList, message, searchMessage];
}

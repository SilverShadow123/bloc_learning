import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/posts/posts_event.dart';
import 'package:bloc_learning/bloc/posts/posts_state.dart';
import 'package:bloc_learning/repository/post_repository.dart';
import 'package:bloc_learning/utils/enums.dart';

class PostBloc extends Bloc<PostsEvent, PostStates> {
  PostRepository postRepository = PostRepository();

  PostBloc() : super(const PostStates()) {
    on<PostFetched>(fetchPostApi);
  }

  void fetchPostApi(PostFetched event, Emitter<PostStates> emit) async {
    await postRepository
        .fetchPosts()
        .then((value) {
          emit(
            state.copyWith(
              postStatus: PostStatus.success,
              message: 'Posts fetched successfully',
              postList: value,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              postStatus: PostStatus.failure,
              message: error.toString(),
            ),
          );
        });
  }
}

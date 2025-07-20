import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/model/posts_model.dart';
import 'package:bloc_learning/bloc/posts/posts_event.dart';
import 'package:bloc_learning/bloc/posts/posts_state.dart';
import 'package:bloc_learning/repository/post_repository.dart';
import 'package:bloc_learning/utils/enums.dart';

class PostBloc extends Bloc<PostsEvent, PostStates> {
  PostRepository postRepository = PostRepository();
  List<PostModel> temPostList = [];

  PostBloc() : super(const PostStates()) {
    on<PostFetched>(fetchPostApi);
    on<SearchItem>(_searchItem);
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

  void _searchItem(SearchItem event, Emitter<PostStates> emit) {
    temPostList =
        state.postList
            .where(
              (element) => element.id.toString() == event.searchText.toString(),
            )
            .toList();
    emit(state.copyWith(tempostList: temPostList));
  }
}

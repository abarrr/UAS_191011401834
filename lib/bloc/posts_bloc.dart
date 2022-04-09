import 'package:akbarzain_191011401834_uas/data_service.dart';
import 'package:akbarzain_191011401834_uas/post.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();

  PostsBloc() : super(LoadingState()) {
    on<PostsEvent>((event, emit) async {
      if (event is LoadEvent || event is PullToRefreshEvent) {
        emit(LoadingState());
        try {
          final posts = await _dataService.getPosts();
          emit(LoadedState(Posts: posts));
        } catch (e) {
          emit(FailedToLoadState(error: e.toString()));
        }
      }
    });
  }
}

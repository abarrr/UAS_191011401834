part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class LoadingState extends PostsState {}

class LoadedState extends PostsState {
  List<Post> Posts;

  LoadedState({required this.Posts});

  get posts => null;
}

class FailedToLoadState extends PostsState {
  String error;

  FailedToLoadState({required this.error});
}

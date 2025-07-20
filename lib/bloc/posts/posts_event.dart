import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable {

  @override
  List<Object?> get props => [];
}

class PostFetched extends PostsEvent {}

class SearchItem extends PostsEvent {
  final String searchText;

  SearchItem({required this.searchText});
  //
  // @override
  // List<Object?> get props => [searchText];
}
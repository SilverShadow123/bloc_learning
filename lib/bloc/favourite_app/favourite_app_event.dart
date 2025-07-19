import 'package:equatable/equatable.dart';

import '../model/favourite_item_model.dart';

abstract class FavouriteAppEvents extends Equatable {
  const FavouriteAppEvents();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteAppEvents {}

class FavouriteItem extends FavouriteAppEvents {
  final FavouriteItemModel item;

  const FavouriteItem({required this.item});
}

class SelectFavouriteItem extends FavouriteAppEvents {
  final FavouriteItemModel item;

  const SelectFavouriteItem({required this.item});
}
class UnSelectFavouriteItem extends FavouriteAppEvents {
  final FavouriteItemModel item;

  const UnSelectFavouriteItem({required this.item});
}

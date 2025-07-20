import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/favourite_app/favourite_app_state.dart';
import 'package:bloc_learning/bloc/model/favourite_item_model.dart';
import 'package:bloc_learning/repository/favourite_repository.dart';

import 'favourite_app_event.dart';

class FavouriteBloc extends Bloc<FavouriteAppEvents, FavouriteItemStates> {
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> temFavouriteList = [];
  FavouriteRepository favouriteRepository;

  FavouriteBloc(this.favouriteRepository) : super(const FavouriteItemStates()) {
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addFavouriteItem);
    on<SelectFavouriteItem>(_selectFavouriteItem);
    on<UnSelectFavouriteItem>(_unSelectFavouriteItem);
    on<DeleteFavouriteItem>(_deleteFavouriteItem);
  }

  void fetchList(
    FetchFavouriteList event,
    Emitter<FavouriteItemStates> emit,
  ) async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success,
      ),
    );
  }

  void _addFavouriteItem(
    FavouriteItem event,
    Emitter<FavouriteItemStates> emit,
  ) async {
    final index = favouriteList.indexWhere(
      (element) => element.id == event.item.id,
    );
    if (event.item.isFavourite) {
      if (temFavouriteList.contains(favouriteList[index])) {
        temFavouriteList.remove(favouriteList[index]);
        temFavouriteList.add(event.item);
      }
    } else {
      if (temFavouriteList.contains(favouriteList[index])) {
        temFavouriteList.remove(favouriteList[index]);
        temFavouriteList.add(event.item);
      }
    }

    favouriteList[index] = event.item;
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouriteList),
        temFavouriteItemList: List.from(temFavouriteList),
        listStatus: ListStatus.success,
      ),
    );
  }

  void _selectFavouriteItem(
    SelectFavouriteItem event,
    Emitter<FavouriteItemStates> emit,
  ) async {
    temFavouriteList.add(event.item);
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouriteList),
        temFavouriteItemList: List.from(temFavouriteList),
        listStatus: ListStatus.success,
      ),
    );
  }

  void _unSelectFavouriteItem(
    UnSelectFavouriteItem event,
    Emitter<FavouriteItemStates> emit,
  ) async {
    temFavouriteList.remove(event.item);
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouriteList),
        temFavouriteItemList: List.from(temFavouriteList),
        listStatus: ListStatus.success,
      ),
    );
  }

  void _deleteFavouriteItem(
    DeleteFavouriteItem event,
    Emitter<FavouriteItemStates> emit,
  ) async {
    for (int i = 0; i < favouriteList.length; i++) {
      favouriteList.remove(temFavouriteList[i]);
    }
    temFavouriteList.clear();
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouriteList),
        temFavouriteItemList: List.from(temFavouriteList),
      ),
    );
  }
}

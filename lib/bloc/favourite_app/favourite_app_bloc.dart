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
    favouriteList[index] = event.item;
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouriteList),
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
}

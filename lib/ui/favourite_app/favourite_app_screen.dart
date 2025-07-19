import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/favourite_app/favourite_app_bloc.dart';
import '../../bloc/favourite_app/favourite_app_event.dart';
import '../../bloc/favourite_app/favourite_app_state.dart';
import '../../bloc/model/favourite_item_model.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    // TODO: implement initState

    context.read<FavouriteBloc>().add(FetchFavouriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourite App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<FavouriteBloc, FavouriteItemStates>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteItemList[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                          value:
                              state.temFavouriteItemList.contains(item)
                                  ? true
                                  : false,
                          onChanged: (value) {
                            if (value!) {
                              context.read<FavouriteBloc>().add(
                                SelectFavouriteItem(item: item),
                              );
                            } else {
                              context.read<FavouriteBloc>().add(
                                UnSelectFavouriteItem(item: item),
                              );
                            }
                          },
                        ),
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            FavouriteItemModel itemModel = FavouriteItemModel(
                              value: item.value,
                              id: item.id,
                              isFavourite: item.isFavourite ? false : true,
                            );
                            context.read<FavouriteBloc>().add(
                              FavouriteItem(item: itemModel),
                            );
                          },
                          icon: Icon(
                            item.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                          ),
                        ),
                      ),
                    );
                  },
                );
              case ListStatus.failure:
                return const Center(child: Text('Failed to load items'));
            }
          },
        ),
      ),
    );
  }
}

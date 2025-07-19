import 'package:bloc_learning/bloc/model/favourite_item_model.dart';

// This class, FavouriteRepository, is responsible for managing data related to favourite items.
// In a real application, this is where you would interact with a database, API, or other data source.
class FavouriteRepository{

  // This asynchronous function, fetchItem, simulates fetching a list of favourite items.
  // The 'async' keyword indicates that this function will perform some operation that might take time
  // (like a network request) and will return a Future.
  // It returns a Future that will eventually resolve to a List of FavouriteItemModel.
 Future<List<FavouriteItemModel>>fetchItem()async{
   // 'await Future.delayed(...)' simulates a network delay or a long-running task.
   // It pauses the execution of this function for 3 seconds.
   await Future.delayed(const Duration(seconds: 3));
   // After the delay, it calls the private helper function _generateList to create a list of 10 items.
   // 'List.of(...)' creates a new modifiable list from the list returned by _generateList.
   return List.of(_generateList(10));
 }

  // This is a private helper function (indicated by the leading underscore '_') used by fetchItem.
  // It's not intended to be called directly from outside this class.
  // It takes an integer 'length' as input.
 List<FavouriteItemModel>_generateList(int length){
   // 'List.generate(length, (index) => ...)' creates a list of a specified 'length'.
   // For each element in the list (from index 0 up to length - 1), it executes the provided function.
   // The function creates a new FavouriteItemModel instance.
   // 'id' is set to the string representation of the current 'index'.
   // 'value' is set to a string like "Item 0", "Item 1", etc.
   return List.generate(length, (index)=> FavouriteItemModel(id: index.toString(), value: 'Item $index'));
 }
}
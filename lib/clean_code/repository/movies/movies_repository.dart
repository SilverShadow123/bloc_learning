import 'package:bloc_learning/clean_code/models/movies/movies.dart';

abstract class MoviesRepository{
  Future<MoviesModel> fetchMoviesList();
}
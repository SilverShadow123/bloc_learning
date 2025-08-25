import 'package:bloc_learning/clean_code/config/app_url.dart';
import 'package:bloc_learning/clean_code/data/network/network_services_api.dart';
import 'package:bloc_learning/clean_code/models/movies/movies.dart';
import 'package:bloc_learning/clean_code/repository/movies/movies_repository.dart';

class MoviesHttpApiRepository implements MoviesRepository {
  final _apiService = NetworkServicesApi();

  @override
  Future<MoviesModel> fetchMoviesList() async {
    final response = await _apiService.getApi(AppUrl.popularMoviesApi);
    return MoviesModel.fromJson(response);
  }
}

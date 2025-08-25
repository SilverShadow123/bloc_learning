import 'package:bloc/bloc.dart';
import 'package:bloc_learning/clean_code/data/response/api_response.dart';
import 'package:bloc_learning/clean_code/repository/movies/movies_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/movies/movies.dart';



part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository;
  MoviesBloc({required this.moviesRepository}) : super(MoviesState(moviesList: ApiResponse.loading())){
  on<MoviesFetched>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi(MoviesFetched event, Emitter<MoviesState> emit) async{
    await moviesRepository.fetchMoviesList().then((value){
      emit (state.copyWith(moviesList: ApiResponse.completed(value)));
    }).onError((error, stackTrace){
      emit (state.copyWith(moviesList: ApiResponse.error(error.toString())));
    });

  }

}

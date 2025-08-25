import 'package:bloc_learning/clean_code/bloc/movies_bloc/movies_bloc.dart';
import 'package:bloc_learning/clean_code/services/storage/local_storage.dart';
import 'package:bloc_learning/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes/routes_name.dart';
import '../../utils/enum.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late MoviesBloc moviesBloc;

  @override
  void initState() {
    // TODO: implement initState
    moviesBloc = MoviesBloc(moviesRepository: getIt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(onPressed: () async {
            LocalStorage localStorage = LocalStorage();
            await localStorage.clearValue('token');
            await localStorage.clearValue('isLoggedIn');
            if (context.mounted) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RoutesName.loginScreen, (route) => false);
            }
          }, icon: Icon(Icons.logout_outlined, color: Colors.red,))
        ],
      ),
      body: BlocProvider(
        create: (_) => moviesBloc..add(MoviesFetched()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            switch(state.moviesList.status){
              case Status.loading:
                return Center(child: CircularProgressIndicator(),);
              case Status.error:
                return  Center(child: Text(state.moviesList.message.toString()));
              case Status.completed:
           if(state.moviesList.data == null){
              return Center(child: Text('No Data Found'));
           }
           final moviesList = state.moviesList.data;
           return ListView.builder(
             itemCount: moviesList?.tvShow.length,
             itemBuilder: (context, index){
                final movie = moviesList!.tvShow[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(movie.imageThumbnailPath),
                    title: Text(movie.name),
                    subtitle: Text('Status: ${movie.status}'),
                    trailing: Text('Country: ${movie.country}'),


                ));
             }
           );
              default:
                return SizedBox();
            }

          },
        ),
      ),
    );
  }
}
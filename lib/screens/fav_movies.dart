import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics/providers/movie_provider.dart';

class FavoriteMovies extends StatefulWidget {
  const FavoriteMovies({Key? key}) : super(key: key);

  @override
  State<FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  @override
  Widget build(BuildContext context) {

    var _myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "My List ${_myList.length}"
        ),
      ),
      body: ListView.builder(
        itemCount: _myList.length,
          itemBuilder: (_, index) {
            final currentMovie = _myList[index];

            return Card(
              key: ValueKey(currentMovie.title),
              elevation: 10,
              child: ListTile(
                title: Text(currentMovie.title),
                subtitle: Text(currentMovie.duration ?? "No information"),
                trailing: TextButton(
                  onPressed: () {
                    context.read<MovieProvider>().removeMovie(currentMovie);
                  },
                  child: const Text("Remove"),

                ),
              ),
            );
          }
      ),
    );
  }
}

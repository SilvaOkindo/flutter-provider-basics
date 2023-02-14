import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../models/movie_model.dart';

final List<Movie> initialData = List.generate(50, (index) => Movie(
    title: "Movie $index",
  duration: "${Random().nextInt(100)}"
));


class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = initialData;
  List<Movie> get movies => _movies;

  List<Movie> myList = [];

  void addMovie(Movie movie) {
    myList.add(movie);
    notifyListeners();
  }

  void removeMovie(Movie movie) {
    myList.remove(movie);
    notifyListeners();
  }
}
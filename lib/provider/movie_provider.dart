import 'package:flutter/material.dart';
import 'package:movies/model/movie_model.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';

final List<Movie> initialData = List.generate(
    50, //generates list of 50 items
    (index) => Movie(
        title: "Movie $index",
        duration: "${Random().nextInt(100) + 60} minutes"));

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = initialData;
  List<Movie> get movies => _movies;
}

import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String?
      duration; //duration of the movie in minutes (more than 100min ofc!)

  Movie({required this.title, this.duration});
}

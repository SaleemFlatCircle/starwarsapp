import 'package:flutter/material.dart';
import 'package:starwars_app/models/film.dart';

class FilmView extends StatefulWidget {
  final Film film;

  FilmView({
    Key? key,
    required this.film,
  }) : super(key: key);

  @override
  _FilmViewState createState() => _FilmViewState(film: film);
}

class _FilmViewState extends State<FilmView> {
  final Film film;

  _FilmViewState({required this.film});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(film.title),
    );
  }
}

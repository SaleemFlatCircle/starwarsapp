
import 'package:flutter/material.dart';
import 'package:starwars_app/models/film.dart';

class FilmList extends StatelessWidget {
  const FilmList({
    Key? key,
    required this.films,
  }) : super(key: key);

  final List<Film> films;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Text(
            films.elementAt(index).title,
          );
        },
        itemCount: films.length,
      ),
    );
  }
}
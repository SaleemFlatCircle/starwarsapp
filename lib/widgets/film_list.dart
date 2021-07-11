import 'package:flutter/material.dart';
import 'package:starwars_app/models/film.dart';
import 'package:starwars_app/widgets/film_list_tile.dart';

class FilmList extends StatelessWidget {
  final ValueChanged<Film> onFilmSelect;

  const FilmList({Key? key, required this.films, required this.onFilmSelect})
      : super(key: key);

  final List<Film> films;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var film = films[index];

          return FilmListTile(
            film: film,
            onFilmSelect: onFilmSelect,
          );
        },
        itemCount: films.length,
      ),
    );
  }
}

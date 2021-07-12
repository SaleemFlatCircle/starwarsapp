import 'package:flutter/material.dart';
import 'package:starwars_app/models/film.dart';
import 'package:starwars_app/services/films_service.dart';

class FilmListTile extends StatelessWidget {
  final ValueChanged<Film> onFilmSelect;
  final filmService = FilmsService();

  FilmListTile({
    Key? key,
    required this.film,
    required this.onFilmSelect
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onFilmSelect(film);
      },
      leading: CircleAvatar(
        child: Image(image: filmService.getPosterForFilm(film)),
        radius: 40,
      ),
      title: Container(
        margin: EdgeInsets.all(4),
        child: Text(
          film.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 4, left: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Director",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(film.director),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4, left: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Poducers",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(film.producer),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

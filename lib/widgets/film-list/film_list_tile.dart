import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:starwars_app/models/film.dart';
import 'package:starwars_app/services/films_service.dart';

class FilmListTile extends StatelessWidget {
  final ValueChanged<Film> onFilmSelect;
  final filmService = FilmsService();

  FilmListTile({Key? key, required this.film, required this.onFilmSelect})
      : super(key: key);

  final Film film;

  String get dateString {
    return DateFormat("yyyy-MM-dd").format(film.releaseDate).toString();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onFilmSelect(film);
      },
      title: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              child: Image(
                image: filmService.getPosterForFilm(film),
                fit: BoxFit.fitHeight,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  height: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        film.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        dateString,
                      ),
                      Spacer(),
                      Text(
                        "Director",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      Text(
                        film.director,
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Poducers",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          film.producer,
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

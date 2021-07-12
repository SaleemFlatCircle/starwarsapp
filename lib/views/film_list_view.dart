import 'package:flutter/material.dart';
import 'package:starwars_app/models/film.dart';
import 'package:starwars_app/services/films_service.dart';
import 'package:starwars_app/widgets/film_list.dart';

class FilmListView extends StatefulWidget {
  final ValueChanged<Film> onFilmSelect;

  FilmListView({Key? key, required this.onFilmSelect}) : super(key: key);

  @override
  _FilmListViewState createState() => _FilmListViewState(onFilmSelect);
}

class _FilmListViewState extends State<FilmListView> {
  late Future<List<Film>> futureFilms;

  final ValueChanged<Film> onFilmSelect;

  _FilmListViewState(this.onFilmSelect);

  @override
  void initState() {
    super.initState();
    var filmsService = FilmsService();

    futureFilms = filmsService.getFilms();
  }

  FutureBuilder<List<Film>> filmsList() {
    return FutureBuilder<List<Film>>(
      future: futureFilms,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Film> films = snapshot.data!;

          return FilmList(films: films, onFilmSelect: onFilmSelect);
        } else if (snapshot.hasError) {

          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Films"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: filmsList(),
      ),
    );
  }
}
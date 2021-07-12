import 'package:flutter/material.dart';
import 'package:starwars_app/models/film.dart';
import 'package:starwars_app/views/film_list_view.dart';
import 'package:starwars_app/views/film_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Film? _selectedFilm;

  void _onFilmSelected(Film film) {
    setState(() {
      _selectedFilm = film;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: Navigator(
        pages: [
          MaterialPage(
            child: FilmListView(
              onFilmSelect: _onFilmSelected,
            ),
          ),
          if (_selectedFilm != null)
            MaterialPage(
              child: FilmView(
                film: _selectedFilm!,
              ),
            )
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          setState(() {
            _selectedFilm = null;
          });

          return true;
        },
      ),
    );
  }
}

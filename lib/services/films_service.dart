import 'package:starwars_app/api/swapi.dart';
import 'package:starwars_app/models/film.dart';

class FilmsService {
  final _swapiApi = SwapiAPI();

  Future<List<Film>>getFilms() {
    return _swapiApi.getFilms();
  }
}
import 'package:starwars_app/api/swapi.dart';
import 'package:starwars_app/models/film.dart';

class FilmsService {
  var swapiApi = SwapiAPI();

  Future<List<Film>>getFilms() {
    return swapiApi.getFilms();
  }
}
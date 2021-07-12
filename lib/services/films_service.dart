import 'package:flutter/material.dart';
import 'package:starwars_app/api/swapi.dart';
import 'package:starwars_app/models/film.dart';

class FilmsService {
  final _swapiApi = SwapiAPI();

  Future<List<Film>> getFilms() {
    return _swapiApi.getFilms();
  }

  AssetImage getPosterForFilm(Film film) {
    switch (film.episodeId) {
      case 1:
        return AssetImage("assets/posters/tpm.jpg");
      case 2:
        return AssetImage("assets/posters/cw.jpg");
      case 3:
        return AssetImage("assets/posters/ros.jpg");
      case 4:
        return AssetImage("assets/posters/nh.jpg");
      case 5:
        return AssetImage("assets/posters/esb.jpg");
      case 6:
        return AssetImage("assets/posters/roj.jpg");
    }

    return AssetImage("");
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starwars_app/models/character.dart';
import 'package:starwars_app/models/film.dart';

class SwapiAPI {
  Future<List<Film>> getFilms() async {
    final response =
        await http.get(Uri.parse("https://www.swapi.tech/api/films/"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body.toString());
      var filmResponseList = data["result"];

      List<Film> films = [];

      filmResponseList.forEach((element) {
        Map<String, dynamic> properties = element["properties"];

        var film = Film.fromJson(properties);
        films.add(film);
        print(film.title);
      });

      return films;
    }

    throw response;
  }

  Future<Character> getCharacterFromUrl(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body.toString());
      
      Map<String, dynamic> responseResult = data["result"];
      Map<String, dynamic> properties = responseResult["properties"];

      return Character.fromJson(properties);
    }

    throw response;
  }
}

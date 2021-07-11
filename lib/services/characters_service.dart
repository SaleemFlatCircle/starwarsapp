import 'package:starwars_app/api/swapi.dart';
import 'package:starwars_app/models/character.dart';

class CharactersService {
  final _swapiApi = SwapiAPI();

  Future<List<Character>> getCharactesFromUrls(List<String> urls) async {
    List<Character> characters = [];
    
    urls.forEach((url) async {
      var character = await _swapiApi.getCharacterFromUrl(url);
      characters.add(character);
    });

    return characters;
  }
}
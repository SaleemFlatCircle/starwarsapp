import 'package:starwars_app/api/swapi.dart';
import 'package:starwars_app/models/character.dart';

class CharactersService {
  final _swapiApi = SwapiAPI();

  Future<List<Character>> getCharactesFromUrls(List<String> urls) async {
    List<Character> characters = [];
    List<Future<Character>> futureCharacters = [];

    for (var url in urls) {
      var futureCharacter = _swapiApi.getCharacterFromUrl(url);
      futureCharacters.add(futureCharacter);    
    }

    characters = await Future.wait(futureCharacters);

    return characters;
  }
}
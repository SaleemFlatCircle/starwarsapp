import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:starwars_app/models/character.dart';
import 'package:starwars_app/models/film.dart';
import 'package:starwars_app/services/characters_service.dart';
import 'package:starwars_app/widgets/character_list.dart';
import 'package:starwars_app/widgets/crawling_text.dart';

class FilmView extends StatefulWidget {
  final Film film;

  FilmView({
    Key? key,
    required this.film,
  }) : super(key: key);

  @override
  _FilmViewState createState() => _FilmViewState(film: film);
}

class _FilmViewState extends State<FilmView> {
  final Film film;
  late Future<List<Character>> futureCharacters;

  _FilmViewState({required this.film});

  @override
  void initState() {
    super.initState();
    var characterService = CharactersService();

    futureCharacters =
        characterService.getCharactesFromUrls(film.characterUrls);
  }

  String get dateString {
    return DateFormat("yyyy-MM-dd").format(film.releaseDate).toString();
  }

  FutureBuilder<List<Character>> characterList() {
    return FutureBuilder<List<Character>>(
      future: futureCharacters,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Character> characters = snapshot.data!;

          return CharacterList(characters: characters);
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
        title: Text(film.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    film.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    dateString,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: characterList(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 4),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              color: Colors.black,
              child: CrawlingText(text: film.openingCrawl),
            ),
          ),
        ],
      ),
    );
  }
}

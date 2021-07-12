import 'package:flutter/material.dart';
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 8),
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
                      film.releaseDate.toString(),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 8),
                child: characterList(),
              ),
              CrawlingText(crawlingText: film.openingCrawl),
            ],
          ),
        ),
      ),
    );
  }
}

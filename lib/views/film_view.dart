import 'package:flutter/material.dart';
import 'package:starwars_app/models/film.dart';

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

  _FilmViewState({required this.film});

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Characters",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      "LOTS AND LOTS AND LOTS AND LOTS AND LOTS AND LOTS AND LOTS AND LOTS AND LOTS AND LOTS AND LOTS AND LOTS",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(film.openingCrawl),
              )
            ],
          ),
        ),
      ),
    );
  }
}

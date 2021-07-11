import 'package:flutter/material.dart';
import 'package:starwars_app/api/swapi.dart';
import 'package:starwars_app/models/film.dart';
import 'package:starwars_app/services/films_service.dart';
import 'package:starwars_app/widgets/film_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Film>> futureFilms;

  @override
  void initState() {
    super.initState();
    var filmsService = FilmsService();

    futureFilms = filmsService.getFilms();
  }

  FutureBuilder<List<Film>> filmsList() {
    return FutureBuilder<List<Film>>(
      future: futureFilms,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Film> films = snapshot.data!;

          return FilmList(films: films);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Container(
        child: filmsList(),
      ),
    );
  }
}


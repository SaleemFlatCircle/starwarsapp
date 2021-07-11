import 'package:flutter/material.dart';
import 'package:starwars_app/models/film.dart';

class FilmListTile extends StatelessWidget {
  const FilmListTile({
    Key? key,
    required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text("image Here"),
        radius: 40,
      ),
      title: Container(
        margin: EdgeInsets.all(4),
        child: Text(
          film.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 4, left: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Director",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(film.director),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4, left: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Poducers",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(film.producer),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

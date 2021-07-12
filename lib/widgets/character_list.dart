import 'package:flutter/material.dart';
import 'package:starwars_app/models/character.dart';

class CharacterList extends StatelessWidget {
  final List<Character> characters;

  const CharacterList({Key? key, required this.characters}) : super(key: key);

  String get characterString {
    var str = "";

    characters.forEach((character) {
      if (str == "") {
        str += character.name;
      } else {
        str += ", ${character.name}";
      }
    });

    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Characters",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          "$characterString",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

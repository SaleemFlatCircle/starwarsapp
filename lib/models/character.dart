class Character {
  String name;

  Character({required this.name});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(name: json["name"]);
  }
}
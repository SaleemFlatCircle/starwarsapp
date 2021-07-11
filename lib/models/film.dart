class Film {
  String title;
  int episodeId;
  List<String> characterUrls;
  String director;
  String openingCrawl;
  String producer;
  DateTime releaseDate;

  Film(
      {required this.title,
      required this.episodeId,
      required this.characterUrls,
      required this.director,
      required this.openingCrawl,
      required this.producer,
      required this.releaseDate});

  factory Film.fromJson(Map<String, dynamic> json) {
    var characters = json["characters"] as List<dynamic>;

    List<String> characterUrls = [];
    
    characters.forEach((element) {
      characterUrls.add(element as String);
    });

    String dateString = json["release_date"];
    DateTime releaseDate = DateTime.parse(dateString);

    return Film(
      title: json["title"],
      episodeId: json["episode_id"],
      characterUrls: characterUrls,
      director: json["director"],
      openingCrawl: json["opening_crawl"],
      producer: json["producer"],
      releaseDate: releaseDate,
    );
  }
}

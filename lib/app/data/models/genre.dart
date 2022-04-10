class Genre {
  late int id;
  String? name;

  Genre({
    required this.id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
  );

  static List<Genre> fromJsonToList(List<dynamic>? genres) {
    if(genres != null) {
      return genres.map<Genre>((genre) => Genre.fromJson(genre)).toList();
    } return [];
  }

}

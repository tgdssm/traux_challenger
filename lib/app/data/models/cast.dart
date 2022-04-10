class Cast {
  late String name;
  late String originalName;
  late String character;

  Cast({
    required this.name,
    required this.originalName,
    required this.character
  });

  factory Cast.fromJson(Map<String,dynamic> json) => Cast(name: json['name'],
      originalName: json['original_name'], character: json['character']);

  static List<Cast> fromJsonToList(List<dynamic>? cast) {
    if(cast != null) {
      return cast.map<Cast>((character) => Cast.fromJson(character)).toList();
    } return [];
  }
}

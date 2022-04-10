class SpokenLanguage {

  late String englishName;
  late String iso6391;
  late String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
    englishName: json["english_name"],
    iso6391: json["iso_639_1"],
    name: json["name"],
  );

  static List<SpokenLanguage> fromJsonToList(List<dynamic>? languages) {
    if(languages != null) {
      return languages.map<SpokenLanguage>((language) => SpokenLanguage.fromJson(language)).toList();
    } return [];
  }

}

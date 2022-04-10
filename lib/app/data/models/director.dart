class Director {
  late String name;
  late String originalName;
  late String job;
  late String department;

  Director({
    required this.name,
    required this.originalName,
    required this.job,
    required this.department,
  });

  factory Director.fromJson(Map<String,dynamic> json) => Director(name: json['name'],
      originalName: json['original_name'], job: json['job'], department: json['department']);

  static List<Director> fromJsonToList(List<dynamic>? directors) {
    if(directors != null) {
      directors.removeWhere((element) => element['job'] != 'Director' && element['department'] != 'Directing');
      return directors.map<Director>((director) => Director.fromJson(director)).toList();
    } return [];
  }
}
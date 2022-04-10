import 'package:traux_challenger/app/data/models/cast.dart';
import 'package:traux_challenger/app/data/models/director.dart';

class Credits{
  late List<Cast> cast;
  late List<Director> directors;

  Credits({required this.cast, required this.directors});
  Credits.init();
  factory Credits.fromJson(Map<String, dynamic> json) => Credits(cast: json['cast'], directors: json['crew']);

}
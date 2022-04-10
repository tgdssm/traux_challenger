import 'package:traux_challenger/app/data/models/credits.dart';
import 'package:traux_challenger/app/data/models/production_company.dart';
import 'package:traux_challenger/app/utils/globals.dart';
import 'genre.dart';

class Movie {
  late bool adult;
  late int id;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late String title;
  late double voteAverage;
  late int voteCount;
  int? budget;
  List<ProductionCompany>? productionCompanies;
  int? revenue;
  int? runtime;
  List<Genre>? genres;
  String? backdropPath;
  String? releaseDate;
  Credits? credits;
  Movie.init();

  Movie({
    required this.adult,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    this.credits,
    this.budget,
    this.genres,
    this.revenue,
    this.runtime,
    this.productionCompanies,
    this.backdropPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json, [Credits? credits]) => Movie(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    budget: json["budget"] ?? 0,
    genres: json["genres"] == null ?
    globalGenres.where((element) => json["genre_ids"].contains(element.id)).toList():
    Genre.fromJsonToList(json["genres"]),
    id: json["id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    productionCompanies: ProductionCompany.fromJsonToList(json["production_companies"]),
    releaseDate: json["release_date"] ?? "",
    revenue: json["revenue"],
    runtime: json["runtime"],
    title: json["title"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
    credits: credits
  );

  static List<Movie> fromJsonToList(List<dynamic> movies) =>
      movies.map<Movie>((movie) => Movie.fromJson(movie)).toList();
}






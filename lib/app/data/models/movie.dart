import 'package:traux_challenger/app/data/models/production_company.dart';
import 'package:traux_challenger/app/data/models/production_country.dart';
import 'package:traux_challenger/app/data/models/spoken_language.dart';
import 'package:traux_challenger/app/utils/globals.dart';

import 'belongs_to_collection.dart';
import 'genre.dart';

class Movie {
  late bool adult;
  late String backdropPath;
  late int id;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late double popularity;
  late String posterPath;
  late String title;
  late bool video;
  late double voteAverage;
  late int voteCount;
  late String releaseDate;
  BelongsToCollection? belongsToCollection;
  int? budget;
  String? status;
  String? tagline;
  String? homepage;
  String? imdbId;
  List<ProductionCompany>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spokenLanguages;
  List<Genre>? genres;
  List<int>? genreIds;


  Movie({
    required this.adult,
    required this.backdropPath,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.genreIds
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    belongsToCollection: json["belongs_to_collection"] != null ?
    BelongsToCollection.fromJson(json["belongs_to_collection"]) : null,
    budget: json["budget"],
    genres: json["genre_ids"] != null ?
    globalGenres.where((element) => json["genre_ids"].contains(element.id)).toList():
    Genre.fromJsonToList(json["genres"]),
    homepage: json["homepage"],
    id: json["id"],
    imdbId: json["imdb_id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    productionCompanies: ProductionCompany.fromJsonToList(json["production_companies"]),
    productionCountries: ProductionCountry.fromJsonToList(json["production_countries"]),
    releaseDate: json["release_date"],
    revenue: json["revenue"],
    runtime: json["runtime"],
    spokenLanguages: SpokenLanguage.fromJsonToList(json["spoken_languages"]),
    status: json["status"],
    tagline: json["tagline"],
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );

  static List<Movie> fromJsonToList(List<dynamic> movies) =>
      movies.map<Movie>((movie) => Movie.fromJson(movie)).toList();
}






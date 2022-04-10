import 'package:traux_challenger/app/data/models/production_company.dart';
import 'package:traux_challenger/app/data/models/production_country.dart';
import 'package:traux_challenger/app/data/models/spoken_language.dart';
import 'package:traux_challenger/app/utils/globals.dart';

import 'belongs_to_collection.dart';
import 'genre.dart';

class Movie {
  late bool adult;
  late int id;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late double popularity;
  late String title;
  late bool video;
  late double voteAverage;
  late int voteCount;
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
  String? backdropPath;
  String? posterPath;
  String? releaseDate;



  Movie({
    required this.adult,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.genreIds,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.productionCompanies,
    this.productionCountries,
    this.backdropPath,
    this.homepage,
    this.imdbId,
    this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    belongsToCollection: json["belongs_to_collection"] != null ?
    BelongsToCollection.fromJson(json["belongs_to_collection"]) : null,
    budget: json["budget"],
    genres: json["genres"] == null ?
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






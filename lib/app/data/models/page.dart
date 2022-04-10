import 'package:traux_challenger/app/data/models/movie.dart';

class Page {
  late int page;
  late List<Movie> results;
  late int totalPages;
  late int totalResults;

  Page({required this.page, required this.results, required this.totalPages, required this.totalResults});

  factory Page.fromJson(Map<String, dynamic> json, List<Movie> movies) => Page(
      page: json['page'], results: movies, totalPages: json['total_pages'], totalResults: json['total_results']);
}
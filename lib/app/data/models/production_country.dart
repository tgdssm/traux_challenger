class ProductionCountry {

  late String iso31661;
  late String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
    iso31661: json["iso_3166_1"],
    name: json["name"],
  );

  static List<ProductionCountry> fromJsonToList(List<dynamic>? countries) {
    if(countries != null) {
      return countries.map<ProductionCountry>((country) => ProductionCountry.fromJson(country)).toList();
    } return [];
  }
}

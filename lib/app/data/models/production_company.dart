class ProductionCompany {

  late int id;
  late String logoPath;
  late String name;
  late String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
    id: json["id"],
    logoPath: json["logo_path"],
    name: json["name"],
    originCountry: json["origin_country"],
  );

  static List<ProductionCompany> fromJsonToList(List<dynamic>? companies) {
    if(companies != null) {
      return companies.map<ProductionCompany>((company) => ProductionCompany.fromJson(company)).toList();
    } return [];
  }
}

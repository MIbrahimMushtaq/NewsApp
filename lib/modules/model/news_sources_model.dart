
List<NewSourcesModel> newSourcesModelFromJson(str) => List<NewSourcesModel>.from((str).map((x) => NewSourcesModel.fromJson(x)));


class NewSourcesModel {
  String? id;
  String? name;
  String? description;
  String? url;
  Category? category;
  String? language;
  String? country;

  NewSourcesModel({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory NewSourcesModel.fromJson(Map<String, dynamic> json) => NewSourcesModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    url: json["url"],
    category: categoryValues.map[json["category"]]!,
    language: json["language"],
    country: json["country"],
  );

}

enum Category {
  BUSINESS,
  ENTERTAINMENT,
  GENERAL,
  HEALTH,
  SCIENCE,
  SPORTS,
  TECHNOLOGY
}

final categoryValues = EnumValues({
  "business": Category.BUSINESS,
  "entertainment": Category.ENTERTAINMENT,
  "general": Category.GENERAL,
  "health": Category.HEALTH,
  "science": Category.SCIENCE,
  "sports": Category.SPORTS,
  "technology": Category.TECHNOLOGY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// ignore_for_file: file_names

class MealModel {
  final int id;
  final String name;
  final String imageUrl;

  MealModel({required this.id, required this.name, required this.imageUrl});

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: int.parse(json['idCategory'] as String),
      name: json['strCategory'],
      imageUrl: json['strCategoryThumb'],
    );
  }
}
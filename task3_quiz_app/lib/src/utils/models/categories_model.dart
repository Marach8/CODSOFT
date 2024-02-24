import 'package:task3_quiz_app/src/utils/constants/strings.dart';

class CategoriesModel{
  final String categoryName;
  final int categoryId;

  const CategoriesModel({
    required this.categoryId,
    required this.categoryName
  });

  factory CategoriesModel.fromJson({required Map<String, dynamic> json}) 
    => CategoriesModel(
      categoryId: json[id], 
      categoryName: json[name]
    );
}
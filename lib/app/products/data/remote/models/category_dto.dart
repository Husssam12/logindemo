import 'package:logindemo/app/products/domain/entities/category.dart';

class CategoryDto {
  final String name;

  CategoryDto({required this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory CategoryDto.fromMap(data) {
    return CategoryDto(
      name: data,
    );
  }

  Category toModel() {
    return Category(
      name: name,
    );
  }
}

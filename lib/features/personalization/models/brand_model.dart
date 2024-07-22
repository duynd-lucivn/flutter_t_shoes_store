import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String image;
  bool? isFeatured;
  String name;
  int? productsCount;

  BrandModel({required this.id, required this.image, this.isFeatured, required this.name, this.productsCount});

  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Name': name,
      'ProductsCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();

    return BrandModel(
      id: data['Id'] ?? '',
      image: data['Image'] ?? '',
      productsCount: int.parse((data['ProductsCount'] ?? 0).toString()),
      isFeatured: data['IsFeatured'] ?? false,
      name: data['Name'] ?? '',
    );
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BrandModel(
        id: document.id,
        image: data['Image'] ?? '',
        productsCount: int.parse((data['ProductsCount'] ?? 0).toString()),
        isFeatured: data['IsFeatured'] ?? false,
        name: data['Name'] ?? '',
      );
    }
    return BrandModel.empty();
  }
}

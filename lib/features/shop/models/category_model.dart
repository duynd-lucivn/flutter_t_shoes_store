import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String parentId;
  bool isFeature;
  String image;
  CategoryModel({required this.id, required this.name, required this.isFeature, this.parentId = '', required this.image});

  static CategoryModel empty() => CategoryModel(id: '', isFeature: false, name: '', parentId: '', image: '');

  Map<String, dynamic> toJson() {
    return {
      'IsFeature': isFeature,
      'Name': name,
      'ParentId': parentId,
      'Image': image,
    };
  }

  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
        id: document.id,
        isFeature: data['IsFeature'] ?? false,
        name: data['Name'] ?? '',
        parentId: data['ParentId'] ?? '',
        image: data['Image'] ?? '',
      );
    } else {
      return CategoryModel.empty();
    }
  }
}

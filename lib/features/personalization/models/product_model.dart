import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/personalization/models/brand_model.dart';
import 'package:t_store/features/personalization/models/product_attribute_model.dart';
import 'package:t_store/features/personalization/models/product_variation_model.dart';

class ProductModel {
  String id;
  BrandModel? brand;
  String? categoryId;
  String? description;
  List<String>? images;
  bool? isFeatured;
  double price;
  List<ProductAttributeModel>? productAttributes;
  String productType;
  List<ProductVariationModel>? productVariations;
  double salePrice;
  String? sku;
  String thumbnail;
  int stock;
  String title;
  DateTime? date;
  ProductModel({
    required this.id,
    this.brand,
    this.categoryId,
    this.description,
    this.images,
    this.isFeatured,
    required this.price,
    this.productAttributes,
    required this.productType,
    this.productVariations,
    this.salePrice = 0.0,
    this.sku,
    this.date,
    required this.thumbnail,
    required this.stock,
    required this.title,
  });

  static ProductModel empty() => ProductModel(id: '', price: 0, productType: '', thumbnail: '', stock: 0, title: '');

  toJson() {
    return {
      'Title': title,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Sku': sku,
      'Stock': stock,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'Brand': brand!.toJson(),
      'CategoryId': categoryId,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      'ProductVariations': productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      sku: data['Sku'],
      stock: data['Stock'] ?? 0,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      price: double.parse((data['Price'] ?? 0.0).toString()),
      id: document.id,
      productType: data['ProductType'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      thumbnail: data['Thumbnail'] ?? '',
      title: data['Title'],
      isFeatured: data['IsFeatured'] ?? false,
      brand: BrandModel.fromJson(data['Brand']),
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson((e))).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson((e))).toList(),
    );
  }
  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      sku: data['Sku'] ?? '',
      stock: data['Stock'] ?? 0,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      price: double.parse((data['Price'] ?? 0.0).toString()),
      id: document.id,
      productType: data['ProductType'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      thumbnail: data['Thumbnail'] ?? '',
      title: data['Title'],
      isFeatured: data['IsFeatured'] ?? false,
      brand: BrandModel.fromJson(data['Brand']),
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson((e))).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson((e))).toList(),
    );
  }
}

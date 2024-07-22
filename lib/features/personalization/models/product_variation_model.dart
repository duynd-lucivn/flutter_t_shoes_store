class ProductVariationModel {
  Map<String, String> attributeValues;
  String? description;
  final String id;
  String image;
  double price;
  String sku;
  double salePrice;
  int stock;

  ProductVariationModel({
    required this.attributeValues,
    this.description = '',
    required this.id,
    this.image = '',
    this.price = 0.0,
    this.sku = '',
    this.salePrice = 0.0,
    this.stock = 0,
  });

  static ProductVariationModel empty() => ProductVariationModel(attributeValues: {}, id: '');

  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Sku': sku,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      image: data['Image'] ?? '',
      sku: data['Sku'] ?? '',
      stock: data['Stock'] ?? 0,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      price: double.parse((data['Price'] ?? 0.0).toString()),
      attributeValues: Map<String, String>.from(data['AttributeValues']),
      id: data['Id'] ?? '',
    );
  }
}

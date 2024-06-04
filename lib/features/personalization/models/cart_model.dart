class CartItemModel {
  String productId;
  String variationId;
  int quantity;
  String title;
  String image;
  String brandName;
  String price;
  String selectedVariation;

  CartItemModel({
    required this.productId,
    required this.variationId,
    required this.quantity,
    required this.title,
    required this.image,
    required this.brandName,
    required this.price,
    required this.selectedVariation,
  });
}

class CartModel {
  String cartId;
  List<CartItemModel> item;

  CartModel({
    required this.cartId,
    required this.item,
  });
}

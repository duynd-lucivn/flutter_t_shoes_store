import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/models/product_model.dart';

import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  // final _firebaseStorage = FirebaseStorage.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong $e';
    }
  }

  // Future<void> uploadDummyData(List<ProductModel> categories) async {
  //   try {
  //     final storage = Get.put(TFirebaseStorageService());
  //     for (var Product in categories) {
  // final file = await storage.getImageDataFromAssets(Product.image);

  // final url = await storage.uploadImageData('Categories', file, Product.name);
  // Product.image = url;

  // await _db.collection('Categories').doc((Product.id)).set(Product.toJson());
//       }
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong $e';
//     }
//   }
}

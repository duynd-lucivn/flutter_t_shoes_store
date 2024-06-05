import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/common/widgets/shimmers/firebase_storage_service.dart';
import 'package:t_store/features/personalization/models/banner_model.dart';

import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  // final _firebaseStorage = FirebaseStorage.instance;

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final snapshot = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      final list = snapshot.docs.map((document) => BannerModel.fromSnapshot(document)).toList();
      return list;
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

  // Future<void> uploadDummyData(List<BannerModel> categories) async {
  //   try {
  //     final storage = Get.put(TFirebaseStorageService());
  //     for (var Banner in categories) {
  //       final file = await storage.getImageDataFromAssets(Banner.image);

  //       final url = await storage.uploadImageData('Categories', file, Banner.name);
  //       Banner.image = url;

  //       await _db.collection('Categories').doc((Banner.id)).set(Banner.toJson());
  //     }
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong $e';
  //   }
  // }
}

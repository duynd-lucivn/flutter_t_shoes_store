import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/utils/formatters/formatter.dart';

class BannerModel {
  final String imageUrl;

  final String targetScreen;

  bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    this.active = false,
  });

  static BannerModel empty() => BannerModel(imageUrl: '', targetScreen: '', active: false);

  // Map<String, dynamic> toJson() {
  //   return {
  //     'firstName': firstName,
  //     'email': email,
  //     'lastName': lastName,
  //     'BannerName': BannerName,
  //     'phoneNumber': phoneNumber,
  //     'profilePicture': profilePicture,
  //   };
  // }

  // factory BannerModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     return BannerModel(
  //       id: document.id,
  //       firstName: data['firstName'] ?? '',
  //       email: data['email'] ?? '',
  //       lastName: data['lastName'] ?? '',
  //       BannerName: data['BannerName'] ?? '',
  //       phoneNumber: data['phoneNumber'],
  //       profilePicture: data['profilePicture'],
  //     );
  //   }
  //   return BannerModel.empty();
  // }
}

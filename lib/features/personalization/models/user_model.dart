import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  final String email;
  String lastName;
  final String userName;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.email,
    required this.lastName,
    required this.userName,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName = "$firstName$lastName";
    String usernameWithPrefix = "cwt$camelCaseUserName";

    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(id: '', firstName: '', email: '', lastName: '', userName: '', phoneNumber: '', profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'email': email,
      'lastName': lastName,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        email: data['email'] ?? '',
        lastName: data['lastName'] ?? '',
        userName: data['userName'] ?? '',
        phoneNumber: data['phoneNumber'],
        profilePicture: data['profilePicture'],
      );
    }
    return UserModel(id: '', firstName: '', email: '', lastName: '', userName: '', phoneNumber: '', profilePicture: '');
  }
}

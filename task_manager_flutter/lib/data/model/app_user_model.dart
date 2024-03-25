import 'package:cloud_firestore/cloud_firestore.dart';

class AppUserModel {
  String? id;
  String? name;
  String? email;
  String? avatar;
  bool? isCheck;

  AppUserModel({this.id, this.name, this.email, this.avatar, this.isCheck});

  factory AppUserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return AppUserModel(
      name: data?['full name'] ?? '',
      email: data?['email address'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "full name": name,
      "email address": email,
    };
  }
}

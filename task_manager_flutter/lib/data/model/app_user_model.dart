import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager_flutter/utils/utils.dart';

class AppUserModel {
  String? id;
  String? name;
  String? email;
  String? avatar;
  bool? isCheck;

  AppUserModel({this.id, this.name, this.email, this.avatar, this.isCheck});

  String memberPicture() => TMUtils.memberPicture(pictureId: email.hashCode);

  factory AppUserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    final data = snapshot?.data();
    return AppUserModel(
      name: data?['full_name'] ?? '',
      email: data?['email_address'] ?? '',
      avatar: data?['avatar'] ?? '',
    );
  }

   factory AppUserModel.fromJson(
      Map<String, dynamic> json) {
    return AppUserModel(
      id: json['id'] ?? '',
      name: json['full_name'] ?? '',
      email: json['email_address'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id" : id,
      "full_name": name,
      "email_address": email,
      "avatar": avatar,
    };
  }
}

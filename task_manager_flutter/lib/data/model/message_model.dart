import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? id;
  String? email;
  String? avatar;
  String? message;
  bool? isManagerMessage;

  MessageModel({
    this.id,
    this.email,
    this.avatar,
    this.message,
    this.isManagerMessage,
  });

  factory MessageModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>>? snapshot,
  ) {
    final data = snapshot?.data();
    return MessageModel(
        id: data?['id'] ?? '',
        email: data?['email'] ?? '',
        avatar: data?['avatar'] ?? '',
        message: data?['message'] ?? '',
        isManagerMessage: data?['is_manager_message']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "email": email,
      "avatar": avatar,
      "message": message,
      "is_manager_message": isManagerMessage,
    };
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager_flutter/data/model/app_user_model.dart';

class UserProvider {
  FirebaseFirestore collection = FirebaseFirestore.instance;

  Future<List<AppUserModel>> getUsers() async {
    final snapShot = await collection.collection('users').get();
    final users =
        snapShot.docs.map((e) => AppUserModel.fromFirestore(e)).toList();
    users.removeWhere((element) => element.email == 'manager@gmail.com');
    return users;
  }
}

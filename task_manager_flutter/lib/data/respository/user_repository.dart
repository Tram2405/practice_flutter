import 'package:task_manager_flutter/data/model/app_user_model.dart';
import 'package:task_manager_flutter/data/provider/user_provider.dart';

class UserRepository{
  final UserProvider userProvider;

  UserRepository({required this.userProvider});

   Future<List<AppUserModel>> getUsers() async{
    return await userProvider.getUsers();
  }
}
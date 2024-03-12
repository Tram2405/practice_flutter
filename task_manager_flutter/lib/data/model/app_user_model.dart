import 'package:task_manager_flutter/gen/assets.gen.dart';

class AppUserModel {
  String? id;
  String? name;
  String? email;
  String? avatar;
  bool? isCheck;

  AppUserModel();
}

List<AppUserModel> users = [
  AppUserModel()
    ..id = '1'
    ..name = 'Jemal'
    ..isCheck = false
    ..avatar = Assets.images.imgAvatarMember1.path
    ..email = 'jemal@gmail.com',
  AppUserModel()
    ..id = '2'
    ..name = 'Jack'
    ..isCheck = false
    ..avatar = Assets.images.imgAvatarMember2.path
    ..email = 'jack@gmail.com',
  AppUserModel()
    ..id = '3'
    ..name = 'Merdan Berdiyev'
    ..isCheck = false
    ..avatar = Assets.images.imgAvatarMember3.path
    ..email = 'berdijev@gmail.com',
  AppUserModel()
    ..id = '4'
    ..name = 'Arslan'
    ..isCheck = false
    ..avatar = Assets.images.imgAvatarMember4.path
    ..email = 'arslan@gmail.com',
  AppUserModel()
    ..id = '5'
    ..name = 'Perhat'
    ..isCheck = false
    ..avatar = Assets.images.imgAvatarMember5.path
    ..email = 'perhat@gmail.com',
  AppUserModel()
    ..id = '6'
    ..name = 'Berdiyev'
    ..isCheck = false
    ..avatar = Assets.images.imgAvatarMember6.path
    ..email = 'berdijec@gmail.com',
  AppUserModel()
    ..id = '7'
    ..name = 'Merdan '
    ..isCheck = false
    ..avatar = Assets.images.imgAvatarMember3.path
    ..email = 'merdan@gmail.com',
  AppUserModel()
    ..id = '8'
    ..name = 'Arslan'
    ..isCheck = false
    ..avatar = Assets.images.imgAvatarMember2.path
    ..email = 'arslan@gmail.com',
];


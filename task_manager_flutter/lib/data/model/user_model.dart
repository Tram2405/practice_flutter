class UserModel {
  late String email;
  late String displayName;

  UserModel(
    this.email,
    this.displayName,
  );

  UserModel.name(
    this.email,
    this.displayName,
  );
}

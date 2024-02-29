import 'dart:typed_data';

class UserModel {
  String token;
  String name;
  Uint8List? avatar;
  bool avatarLoading = false;
  String phone;

  UserModel({
    this.name = "",
    this.token = "",
    this.phone = "",
    this.avatar,
  });
}

class UserModel {
  String? name;
  String? email;
  String? avatar;

  UserModel({required this.name, required this.email, required this.avatar});
  UserModel.fromJson(Map<String, dynamic> map) {
    name = map["name"];
    email = map["email"];
    avatar = map["avatar"];
  }
}

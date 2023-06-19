class LoginModel {
  LoginModel({
    required this.userName,
    required this.password,
  });

  LoginModel.fromJson(dynamic json) {
    userName = json['userName'];
    password = json['password'];
  }

  String? userName;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = userName;
    map['password'] = password;
    return map;
  }
}

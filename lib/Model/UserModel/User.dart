class Response {
  String responseCode;
  String responseMessage;
  ResponseData responseData;

  Response({
    required this.responseCode,
    required this.responseMessage,
    required this.responseData,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      responseCode: json['responseCode'],
      responseMessage: json['responseMessage'],
      responseData: ResponseData.fromJson(json['responseData']),
    );
  }
}

class ResponseData {
  List<User> users;

  ResponseData({
    required this.users,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    var list = json['users'] as List<dynamic>;
    List<User> users = list.map((item) => User.fromJson(item)).toList();

    return ResponseData(users: users);
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? gender;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.gender});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['password'] = this.password;
    return data;
  }
}

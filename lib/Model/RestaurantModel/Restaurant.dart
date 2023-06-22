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
  List<Restaurants> restaurants;

  ResponseData({
    required this.restaurants,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    var list = json['restaurants'] as List<dynamic>;
    List<Restaurants> restaurants =
        list.map((item) => Restaurants.fromJson(item)).toList();

    return ResponseData(restaurants: restaurants);
  }
}

class Restaurants {
  int? id;
  String? name;
  String? address;
  String? phone;
  double? rating;

  Restaurants({this.id, this.name, this.address, this.phone, this.rating});

  Restaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['rating'] = this.rating;
    return data;
  }
}

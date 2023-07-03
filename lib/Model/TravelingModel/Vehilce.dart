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
  List<Vehicle> vehicles;

  ResponseData({
    required this.vehicles,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    var list = json['vehicles'] as List<dynamic>;
    List<Vehicle> vehicles =
        list.map((item) => Vehicle.fromJson(item)).toList();

    return ResponseData(vehicles: vehicles);
  }
}

class Vehicle {
  int? id;
  String? name;
  String? price;
  String? phone;
  double? rating;
  String? type;
  String? transport;

  Vehicle(
      {this.id,
      this.name,
      this.price,
      this.phone,
      this.rating,
      this.type,
      this.transport});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    phone = json['phone'];
    rating = json['rating'];
    transport = json['transport'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['phone'] = this.phone;
    data['rating'] = this.rating;
    data['transport'] = this.transport;
    data['type'] = this.type;
    return data;
  }
}

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
  List<Hotels> hotels;

  ResponseData({
    required this.hotels,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    var list = json['hotels'] as List<dynamic>;
    List<Hotels> hotels = list.map((item) => Hotels.fromJson(item)).toList();

    return ResponseData(hotels: hotels);
  }
}

class Hotels {
  int? id;
  String? name;
  String? address;
  String? phone;
  double? rating;

  Hotels({this.id, this.name, this.address, this.phone, this.rating});

  Hotels.fromJson(Map<String, dynamic> json) {
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

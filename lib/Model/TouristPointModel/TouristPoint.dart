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
  List<TouristPoint> places;

  ResponseData({
    required this.places,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    var list = json['places'] as List<dynamic>;
    List<TouristPoint> places = list.map((item) => TouristPoint.fromJson(item)).toList();

    return ResponseData(places: places);
  }
}

class TouristPoint {
  int id;
  String name;
  String location;
  String description;

  TouristPoint({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
  });

  factory TouristPoint.fromJson(Map<String, dynamic> json) {
    return TouristPoint(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      description: json['description'],
    );
  }
}

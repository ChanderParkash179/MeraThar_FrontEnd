import 'dart:convert';

import 'package:front_app/Model/RestaurantModel/Restaurant.dart';
import 'package:front_app/Utils/Endpoints.dart';
import 'package:http/http.dart' as http;

class RestaurantService {
  Future<Response> getRestaurantsByCityName(String cityName) async {
    final url = Uri.parse(Endpoints.restaurantGetWithCityName);
    final response = await http.post(
      url,
      body: json.encode({'cityName': cityName}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Response.fromJson(jsonData);
    } else {
      throw Exception('Failed to load hotels');
    }
  }
}

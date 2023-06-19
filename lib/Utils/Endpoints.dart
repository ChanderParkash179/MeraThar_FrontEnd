class Endpoints {
  static var baseUrl = 'http://locahost:8081/api/mera_thar/';

  static var login = 'http://localhost:8081/api/mera_thar/user/login';
  static var register = 'http://localhost:8081/api/mera_thar/user/register';
  static var forgotPassword = 'http://localhost:8081/api/mera_thar/user/forgot';

  // ADMIN ENDPOINTS
  static var adminList = 'http://localhost:8081/api/mera_thar/admin/list';
  static var adminGet = 'http://localhost:8081/api/mera_thar/admin/get';
  static var adminAdd = 'http://localhost:8081/api/mera_thar/admin/add';
  static var adminUpdate = 'http://localhost:8081/api/mera_thar/admin/update';
  static var adminDelete = 'http://localhost:8081/api/mera_thar/admin/delete';

  // CITY ENDPOINTS
  static var cityList = 'http://localhost:8081/api/mera_thar/city/list';
  static var cityGet = 'http://localhost:8081/api/mera_thar/city/get';
  static var cityAdd = 'http://localhost:8081/api/mera_thar/city/add';
  static var cityUpdate = 'http://localhost:8081/api/mera_thar/city/update';
  static var cityDelete = 'http://localhost:8081/api/mera_thar/city/delete';

  // TOURIST POINT ENDPOINTS
  static var touristPointList = 'http://localhost:8081/api/mera_thar/city/tourist-point/list';
  static var touristPointGet = 'http://localhost:8081/api/mera_thar/city/tourist-point/get';
  static var touristPointGetWithCityName = 'http://localhost:8081/api/city/tourist-point/get/city-name';
  static var touristPointAdd = 'http://localhost:8081/api/mera_thar/city/tourist-point/add';
  static var touristPointUpdate = 'http://localhost:8081/api/mera_thar/city/tourist-point/update';
  static var touristPointDelete = 'http://localhost:8081/api/mera_thar/city/tourist-point/delete';

  // HOTEL ENDPOINTS
  static var hotelList = 'http://localhost:8081/api/mera_thar/city/hotel/list';
  static var hotelGet = 'http://localhost:8081/api/mera_thar/city/hotel/get';
  static var hotelAdd = 'http://localhost:8081/api/mera_thar/city/hotel/add';
  static var hotelUpdate = 'http://localhost:8081/api/mera_thar/city/hotel/update';
  static var hotelDelete = 'http://localhost:8081/api/mera_thar/city/hotel/delete';
}

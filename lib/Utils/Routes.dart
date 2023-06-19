import 'package:front_app/Views/AppServicesViews/CultureView.dart';
import 'package:front_app/Views/AppServicesViews/HotelView.dart';
import 'package:front_app/Views/AppServicesViews/RestaurantView.dart';
import 'package:front_app/Views/AppServicesViews/TravelingView.dart';
import 'package:front_app/Views/AppServicesViews/TouristPointView.dart';
import 'package:front_app/Views/CitiesViews/MithiView.dart';
import 'package:front_app/Views/CitiesViews/NagarParkarView.dart';
import 'package:front_app/Views/CitiesViews/UmerkotView.dart';
import 'package:front_app/Views/CommonViews/LoginView.dart';
import 'package:front_app/Views/CommonViews/RegisterView.dart';
import 'package:front_app/Views/CommonViews/SplashView.dart';
import 'package:front_app/Views/CommonViews/TouristView.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> routes = [
    // SCREENS
    GetPage(name: '/', page: () => const SplashView()),
    GetPage(name: '/splashView', page: () => const SplashView()),
    GetPage(name: '/loginView', page: () => const LoginView()),
    GetPage(name: '/registerView', page: () => const RegisterView()),
    GetPage(name: '/touristView', page: () => const TouristView()),

    // CITIES PAGE
    GetPage(name: '/umerkotView', page: () => const UmerkotView()),
    GetPage(name: '/nagarparkarView', page: () => const NagarParkarView()),
    GetPage(name: '/mithiView', page: () => const MithiView()),

    // SERVICES PAGE
    GetPage(name: '/cultureView', page: () => const CultureView()),
    GetPage(name: '/hotelView', page: () => const HotelView()),
    GetPage(name: '/restaurantView', page: () => const RestaurantView()),
    GetPage(name: '/travelingView', page: () => const TravelingView()),
    GetPage(name: '/touristPointView', page: () => TouristPointView()),
  ];
}

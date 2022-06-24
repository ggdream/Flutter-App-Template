import 'package:get/get.dart';

import 'package:client/pages/home/home.dart';
import 'package:client/pages/profile/profile.dart';

class AppRouter {
  AppRouter._();

  static const initRoute = index;

  static const index = '/home';
  static const home = '/home';
  static const profile = '/profile';

  static final List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}

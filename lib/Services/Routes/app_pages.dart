
import 'package:foodpanda_clone/Controller/home_controller.dart';
import 'package:foodpanda_clone/Controller/login_controller.dart';
import 'package:foodpanda_clone/View/Screens/home_screen.dart';
import 'package:foodpanda_clone/View/Screens/login_screen.dart';
import 'package:foodpanda_clone/View/Screens/splash_screen.dart';
import 'package:foodpanda_clone/View/Screens/unknow_route_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final unknownRoute = GetPage(
    name: _Paths.unknown404,
    page: () => const Unknown404Screen(),
  );
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(
            () => Get.lazyPut<LoginController>(() => LoginController()),
      ),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeScreen(),
      binding: BindingsBuilder(
            () => Get.lazyPut<HomeController>(() => HomeController()),
      ),
      children: [

      ],
    ),
  ];
}

class BindingsX {
  static BindingsBuilder initialBindigs() {
    return BindingsBuilder(() {
      // Get.lazyPut<APIRepository>(() => APIRepository(), fenix: true);
      // Get.lazyPut<APICall>(() => APICall(), fenix: true);
    });
  }
}
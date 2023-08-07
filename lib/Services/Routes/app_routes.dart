part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const unknown404 = _Paths.unknown404;
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const home = _Paths.home;
}

abstract class _Paths {
  static const unknown404 = '/404';
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';

}
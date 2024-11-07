import 'package:contact_app_getx/app/modules/auth/routes/pages.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = AuthRoutes.SPLASH;

  static final routes = [
    ...AuthPages.routes,
  ];
}

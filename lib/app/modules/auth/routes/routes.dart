// ignore_for_file: constant_identifier_names

part of 'pages.dart';

abstract class AuthRoutes {
  AuthRoutes._();
  static const SPLASH = _MainPaths.SPLASH;
  static const HOME = _MainPaths.HOME;
}

abstract class _MainPaths {
  _MainPaths._();
  static const SPLASH = '/splash';
  static const HOME = '/home';
}

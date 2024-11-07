import 'package:contact_app_getx/app/modules/auth/di.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AppDependencyInjection {
  AppDependencyInjection();

  Future<void> init() async {
    Get.lazyPut(() => CancelToken(), fenix: true);

    AuthDependencyInjection().init();
  }
}

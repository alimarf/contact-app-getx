import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../../core/base/base_controller.dart';
import '../../../../../core/config/app_config.dart';
import '../../../../../core/services/auth_token_manager.dart';
import '../../../../../core/utils/toast/toast.dart';
import '../../../auth/routes/pages.dart';

class SplashController extends BaseController {
  final AuthTokenManager authTokenManager;

  final versionName = Rxn<String>();
  final buildNumber = Rxn<String>();

  SplashController({
    required this.authTokenManager,
  });

  getApplicationVersion() => _getApplicationVersion();
  // goToLogin() => _goToLogin();

  @override
  Future<void> onReady() async {
    super.onReady();

    await fetchData();

    final existingAuth = authTokenManager.getAccessToken();

    // if (existingAuth != null) {
    //   goToLogin();
    // }
  }

  Future<void> fetchData() async {
    await getApplicationVersion();
  }

  Future<void> _getApplicationVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    versionName.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;
  }

  // void _goToLogin() {
  //   Get.offAndToNamed(AuthRoutes.LOGIN);
  // }
}

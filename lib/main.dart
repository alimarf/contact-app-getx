import 'dart:async';
import 'dart:developer';

import 'package:contact_app_getx/initilatizer.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';

import 'app/app.dart';
import 'app/di.dart';
import 'app/initializer.dart';
import 'core/config/app_config.dart';
import 'core/values/flavor/flavor.dart';
import 'di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "./environments/.env.prod");

  final appConfig = Get.put(
      AppConfig(
          flavor: AppFlavor.dev,
          appName: dotenv.get('APP_NAME'),
          appIcon: dotenv.get('APP_ICON'),
          apiBaseUrl: dotenv.get('API_BASE_URL'),
          storageUrl: dotenv.get('STORAGE_URL'),
          connectionCheckerUrl: dotenv.get('CONNECTION_CHECKER_URL'),
          storageKey: dotenv.get('STORAGE_KEY'),
          version: dotenv.get('VERSION'),
          storageVersion: dotenv.get('STORAGE_VERSION')),
      permanent: true);

  if (kDebugMode) {
    final packageInfo = await PackageInfo.fromPlatform();

    PackageInfo.setMockInitialValues(
      appName: packageInfo.appName,
      packageName: packageInfo.packageName,
      version: appConfig.version.split('+').first,
      buildNumber: appConfig.version.split('+').last,
      buildSignature: '',
    );
  }

  await Initializer(appConfig).run();
  await DependencyInjection(appConfig).init();

  await AppInitializer().run();
  await AppDependencyInjection().init();

  runApp(App());
}

@pragma('vm:entry-point')
Future<void> send() async {
  print('Called refresh task');
}

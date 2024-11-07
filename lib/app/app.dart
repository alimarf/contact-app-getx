import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../core/config/app_config.dart';
import '../core/ui/colors/colors.dart';
import '../core/ui/constants/sizes.dart';
import '../core/ui/themes/themes.dart';
import '../core/values/flavor/flavor.dart';
import 'routes/app_pages.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AppConfig config = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey:
          AppConfig.instance.flavor == AppFlavor.dev && !GetPlatform.isWeb
              ? Get.find<Alice>().getNavigatorKey()
              : null,
      // navigatorObservers: [Get.find<AppAnalytics>().observer],
      title: config.appName,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      getPages: AppPages.routes,
      // translations: AppTranslations(),
      locale: Get.deviceLocale,
      initialRoute: AppPages.INITIAL,
      builder: (context, widget) {
        return Stack(
          children: [
            widget ?? const SizedBox(),
            if (AppConfig.instance.flavor == AppFlavor.dev)
              Positioned(
                  bottom: AppSizes.margin,
                  right: AppSizes.margin,
                  child: Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.find<Alice>().showInspector();
                      },
                      child: Icon(
                        size: 40,
                        LucideIcons.bug,
                        color: AppColors.primary.withOpacity(0.6),
                      ),
                    ),
                  ))
          ],
        );
      },
    );
  }
}

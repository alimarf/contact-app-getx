import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/ui/colors/colors.dart';
import '../../../../../core/ui/widgets/orgranigrams/o_scaffold.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OScaffold(
      showBackground: false,
      backgroundColor: AppColors.primary.shade800,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
            ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors/colors.dart';

// ignore: must_be_immutable
class OScaffold extends StatelessWidget {
  PreferredSizeWidget? appBar;
  Key? key;
  Color? backgroundColor;
  bool showBackground;
  Widget? body;
  Widget? bottomNavigationBar;
  bool? resizeToAvoidBottomInset;
  bool? extendBodyBehindAppBar;
  Widget? floatingActionButton;
  Widget? drawer;
  FloatingActionButtonLocation? floatingActionButtonLocation;

  OScaffold(
      {this.key,
      this.appBar,
      this.body,
      this.backgroundColor,
      this.showBackground = true,
      this.bottomNavigationBar,
      this.resizeToAvoidBottomInset = true,
      this.extendBodyBehindAppBar = false,
      this.drawer,
      this.floatingActionButton,
      this.floatingActionButtonLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        key: key,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        drawer: drawer,
        body: body,
        backgroundColor: backgroundColor ??
            (Get.isDarkMode ? AppColors.black : AppColors.white),
        bottomNavigationBar: bottomNavigationBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBodyBehindAppBar: extendBodyBehindAppBar == true);
  }
}

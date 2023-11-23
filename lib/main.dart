import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:new_app/s.dart';

import 'modules/splash/splash_view.dart';

var deviceHeight = Get.height;
var deviceWidth = Get.width;
void main() {
  runApp(const MyApp());
  pSetSettings(primaryColor: Clr.primaryColor, secondaryColor: Clr.secondColor);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: S.appTitle,
      theme: ThemeData(
        primaryColor: Clr.primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Clr.secondColor,
          primary: Clr.primaryColor,
        ),
        useMaterial3: false,
      ),
      home: const SplashView(),
    );
  }
}



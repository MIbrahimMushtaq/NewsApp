import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:new_app/modules/splash/splash_logic.dart';
import '../../s.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashLogic>(
      init: SplashLogic(),
      builder: (logic) {
      return  Material(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Image.asset(Img.logo,),
          ),
        ),
      );
    },);
  }
}

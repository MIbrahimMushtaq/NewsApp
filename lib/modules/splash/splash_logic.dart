import 'dart:async';

import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';

import '../home/home_view.dart';

class SplashLogic extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    onInitialCall();
    super.onInit();
  }

  onInitialCall(){
    Timer(2.seconds, () {
      pSetRout(page: ()=>const HomeView(),routeType: RouteType.pushReplace);
    });
  }
}
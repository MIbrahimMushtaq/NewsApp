import 'dart:async';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import '../home/home_view.dart';

class SplashLogic extends GetxController{

  @override
  void onInit() {
    onInitialCall();
    super.onInit();
  }

  onInitialCall(){
    Future.delayed(2.seconds).then((value){
      pSetRout(page: ()=>const HomeView(),routeType: RouteType.pushReplace);
    });
  }
}
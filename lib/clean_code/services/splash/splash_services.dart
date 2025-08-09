import 'dart:async';

import 'package:bloc_learning/clean_code/services/session_manager/session_controller.dart';
import 'package:flutter/material.dart';

import '../../config/routes/routes_name.dart';

class SplashServices{
  void isLogin(BuildContext context){
    SessionController().getUserFromPreferences().then((value){
      if(SessionController().isLoggedIn?? false){
        Timer(Duration(seconds: 3),()=>Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (route) => false));
      }else{
        Timer(Duration(seconds: 3),()=>Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false));
      }

    }).onError((error , stackTrace){
      Timer(Duration(seconds: 3),()=>Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false));
    });

  }
}
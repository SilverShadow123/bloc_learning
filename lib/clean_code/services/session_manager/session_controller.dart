import 'dart:convert';

import 'package:bloc_learning/clean_code/models/user/user_model.dart';
import 'package:bloc_learning/clean_code/services/storage/local_storage.dart';
import 'package:flutter/cupertino.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();
  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLoggedIn;

  SessionController._internal() {
    isLoggedIn = false;
  }

  factory SessionController() {
    return _session;
  }
  
  Future<void> saveUserInPreferences(dynamic user) async{
    localStorage.setValue('token', jsonEncode(user));
    localStorage.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPreferences() async{
    try{
      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');
      if(userData.isNotEmpty){
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLoggedIn = isLogin == 'true' ? true : false;
    }catch(e){
      debugPrint(e.toString());
    }
  }
  
}

import 'package:bloc_learning/clean_code/config/app_url.dart';
import 'package:bloc_learning/clean_code/data/network/network_services_api.dart';
import 'package:bloc_learning/clean_code/models/user/user_model.dart';

class LoginRepository {
  final _api = NetworkServicesApi();
  Future<UserModel> loginApi(dynamic data) async{
final response = await _api.postApi(AppUrl.loginApi, data);
return UserModel.fromJson(response);

  }

}
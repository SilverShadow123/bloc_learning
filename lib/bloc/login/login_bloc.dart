import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_onLoginApi);
  }
  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }
  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }
  void _onLoginApi(LoginApi event, Emitter<LoginState> emit) async{

    emit(state.copyWith(loginstatus: LoginStatus.loading));
    Map data = {
      'email': state.email,
      'password': state.password,
    };
    try {
      final response = await http.post(Uri.parse('https://reqres.in/api/login'), headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
        'Authorization': 'QpwL5tke4Pnpja7X4'
      },body: json.encode(data));
      if (response.statusCode == 200) {
        print(response.body);
        emit(state.copyWith(loginstatus: LoginStatus.success, message: 'Login Successful'));
      } else{
        emit(state.copyWith(loginstatus: LoginStatus.failure, message: 'Login Failed'));
      }
    }catch(e){
   emit(state.copyWith(loginstatus: LoginStatus.failure, message: e.toString()));

    }
  }
}



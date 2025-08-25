

import 'package:equatable/equatable.dart';

import '../../utils/enum.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  final PostApiStatus postApiStatus;
  const LoginState({this.email='', this.password='',this.message='',this.postApiStatus = PostApiStatus.initial});

  LoginState copyWith({String? email, String? password, PostApiStatus? postApiStatus, String? message}) {
    return LoginState(
      postApiStatus: postApiStatus ?? this.postApiStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [email, password, postApiStatus, message];
}
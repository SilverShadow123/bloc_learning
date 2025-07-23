part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failure,
}

class LoginState extends Equatable {
 final String email;
  final String password;
  final String message;
  final LoginStatus loginstatus;

  const LoginState({this.email='', this.password='', this.message='', this.loginstatus=LoginStatus.initial});

  LoginState copyWith({
    String? email,
    String? password,
    String? message,
    LoginStatus? loginstatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loginstatus: loginstatus ?? this.loginstatus,
    );
  }

  @override
  List<Object?> get props =>[ email, password, message, loginstatus];
}


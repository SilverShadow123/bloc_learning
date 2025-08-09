
import 'package:bloc_learning/clean_code/models/user/user_model.dart';
import 'package:bloc_learning/clean_code/repository/auth/login_repository.dart';
import 'package:bloc_learning/clean_code/views/login/widgets/widget.dart';
import 'package:bloc_learning/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    _loginBloc = LoginBloc(loginRepository: getIt());
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }
  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  UserModel userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          centerTitle: true,
          backgroundColor: Theme
              .of(context)
              .primaryColor,
          elevation: 0,
        ),
        body: BlocProvider(
          create: (_) => _loginBloc,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    EmailInputWidget(emailFocusNode: emailFocusNode),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginButton(formKey: _formKey),
                  ]),
            ),
          ),
        ));
  }
}

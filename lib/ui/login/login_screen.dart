import 'package:bloc_learning/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    _loginBloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Please enter your credentials to login',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 32),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen:
                    (current, previous) => current.email != previous.email,
                builder: (context, state) {
                  return TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      context.read<LoginBloc>().add(EmailChanged(email: value));
                    },
                    onFieldSubmitted: (value) {},
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen:
                    (current, previous) =>
                current.password != previous.password,
                builder: (context, state) {
                  return TextFormField(
                    obscureText: true,
                    focusNode: passwordFocusNode,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      context.read<LoginBloc>().add(
                        PasswordChanged(password: value),
                      );
                    },
                    onFieldSubmitted: (value) {},
                  );
                },
              ),
              const SizedBox(height: 24),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
if(state.loginstatus ==LoginStatus.failure){
  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(state.message.toString())));
} if(state.loginstatus ==LoginStatus.loading){
  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text('Submitting...')));
}    if(state.loginstatus ==LoginStatus.success){
  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text('Login Successful')));
}                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginApi());
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Login'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

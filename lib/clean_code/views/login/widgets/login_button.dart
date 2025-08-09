import 'package:bloc_learning/clean_code/config/routes/routes_name.dart';
import 'package:bloc_learning/clean_code/utils/enum.dart';
import 'package:bloc_learning/clean_code/utils/flush_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.postApiStatus != current.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          FlushBarHelper.flashBarErrorMessage(
              state.message.toString(), context);
        }
        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamed(context, RoutesName.homeScreen);
          FlushBarHelper.flashBarSuccessMessage('Login Successful', context);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) =>
            previous.postApiStatus != current.postApiStatus,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginApi());
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              elevation: 5,
              shadowColor: Colors.grey.withAlpha(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: state.postApiStatus == PostApiStatus.loading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text('Login'),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;

  const PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current, previous) => current.password != previous.password,
      builder: (context, state) {
        return TextFormField(
          focusNode: passwordFocusNode,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}

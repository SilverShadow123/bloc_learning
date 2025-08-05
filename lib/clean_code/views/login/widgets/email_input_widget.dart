import 'package:bloc_learning/clean_code/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  const EmailInputWidget({super.key, required this.emailFocusNode});

  final FocusNode emailFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current, previous)=>current.email != previous.email,
      builder: (context, state) {
        return TextFormField(
          focusNode: emailFocusNode,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value){
            print('Dispatching EmailChanged with $value');
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            } if (!Validations.emailValidator(value)){
              return 'Please enter a valid email address';
            }
            return null; // Add this line
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}

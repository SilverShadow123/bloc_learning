import 'package:bloc_learning/clean_code/services/storage/local_storage.dart';
import 'package:flutter/material.dart';

import '../../config/routes/routes_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(onPressed: () async {
            LocalStorage localStorage = LocalStorage();
            await localStorage.clearValue('token');
            await localStorage.clearValue('isLoggedIn');
            if (context.mounted) {
              Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false);
            }
          }, icon: Icon(Icons.logout_outlined,color: Colors.red,))
        ],
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
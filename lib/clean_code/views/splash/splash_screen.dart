import 'package:bloc_learning/clean_code/config/components/internet_exception_widget.dart';
import 'package:bloc_learning/clean_code/config/components/loading_widget.dart';
import 'package:bloc_learning/clean_code/config/components/round_button.dart';
import 'package:flutter/material.dart';

import '../../config/data/exceptions/app_exceptions.dart';
import '../../config/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        throw NoInternetException();
      }),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundButton(title: 'Login',onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>InternetExceptionWidget(onPress: () {  },)));
                  }, height: 40,),
                  LoadingWidget(size: 50),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                   Navigator.pushNamed(context, RoutesName.homeScreen);
                    },
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    child: Text('Home'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

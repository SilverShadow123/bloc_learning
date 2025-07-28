import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_learning/clean_code/config/data/exceptions/app_exceptions.dart';
import 'package:bloc_learning/clean_code/config/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkServicesApi implements BaseApiServices{
  @override
  Future<dynamic> getApi(String url) async{

    dynamic jsonResponse;

   try{
     
     final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
     jsonResponse = returnResponse(response);


     if(response.statusCode == 200){

     }
   }on SocketException{
     throw NoInternetException('');
   }on TimeoutException{
      throw TimeoutException('Request timeout');
   }
   return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url,var data) async{
    dynamic jsonResponse;

    try{

      final response = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);


      if(response.statusCode == 200){

      }
    }on SocketException{
      throw NoInternetException('');
    }on TimeoutException{
      throw TimeoutException('Request timeout');
    }
    return jsonResponse;
  }


  dynamic returnResponse(http.Response response){
    switch (response){
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorizedException('Unauthorized request');
      case 500:
       throw FetchDataException('Error occurred while communicating with server'+response.statusCode.toString());
       default:
         throw UnauthorizedException();
    }
  }
  
}
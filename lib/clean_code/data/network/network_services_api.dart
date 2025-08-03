import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../exceptions/app_exceptions.dart';
import 'base_api_services.dart';

class NetworkServicesApi implements BaseApiServices{
  @override
  Future<dynamic> getApi(String url) async{

    dynamic jsonResponse;

   try{
     
     final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
     jsonResponse = returnResponse(response);
     // No need for an additional check for statusCode 200 here,
     // as returnResponse already handles different status codes.
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

    }on SocketException{
      throw NoInternetException('');
    }on TimeoutException{
      throw TimeoutException('Request timeout');
    }
    return jsonResponse;
  }


  dynamic returnResponse(http.Response response){
    switch (response.statusCode){
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        throw BadRequestException(jsonResponse['message'] ?? 'Bad request');
      case 401:
        throw UnauthorizedException('Unauthorized request');
      case 500:
       throw FetchDataException('Error occurred while communicating with server: ${response.statusCode}');
       default:
         throw FetchDataException('Error occurred: ${response.statusCode}');
    }
  }
  
}
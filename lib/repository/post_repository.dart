import 'dart:convert';
import 'dart:io';

import 'package:bloc_learning/bloc/model/posts_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e) {
          return PostModel(
            postId: e['postId'] as int,
            id: e['id'] as int,
            name: e['name'] as String,
            email: e['email'] as String,
            body: e['body'] as String,
          );
        }).toList();
      }
    } on SocketException {
      throw Exception('No Internet Connection');
    } on HttpException {
      throw Exception('Failed to load posts');
    } on FormatException {
      throw Exception('Bad response format');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
    throw Exception('Failed to fetch posts');
  }
}

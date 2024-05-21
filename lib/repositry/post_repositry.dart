import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_learn/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<Post>> fetchPostData() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return Post(
            userId: e["userId"],
            id: e["id"],
            title: e["title"] as String,
            body: e["body"] as String,
          );
        }).toList();
      }
    } on SocketException {
      throw "Please check your internet connection";
    } on TimeoutException {
      throw "Error while fetching";
    }
    throw "Error";
  }
}

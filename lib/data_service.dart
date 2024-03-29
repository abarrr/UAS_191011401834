import 'dart:convert';
import 'dart:html';
import 'package:akbarzain_191011401834_uas/post.dart';
import 'package:http/http.dart' as http;

class DataService {
  //https://jsonplaceholder.typicode.com/posts
  final _baseUrl = 'jsonplaceholder.typicode.com';
  Future<List<Post>> getPosts() async {
    try {
      final url = Uri.https(_baseUrl, '/posts');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final posts = json.map((e) => Post.fromJson(e)).toList();
        return posts;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      rethrow;
    }
  }
}

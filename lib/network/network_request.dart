import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_demo/model/photo.dart';
import 'package:riverpod_demo/model/users.dart';

class NetworkRequest {
  Future<List<Photo>?> fetchPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List<dynamic>;
      List<Photo> result = list.map((e) => Photo.fromJson(e)).toList();
      return result;
    } else {
      throw Exception('Something went wrong!!');
    }
  }

  Future<Users> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=20'));

    if (response.statusCode == 200) {
      print('response');
      print(response.body);
      final parsedJson = usersFromJson(response.body);
      return parsedJson;
    } else {
      throw Exception('Something went wrong!!');
    }
  }
}

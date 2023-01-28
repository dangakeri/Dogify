import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class ApiService {
  static Future<Dog> getData() async {
    try {
      var response =
          await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
      print(response.body);

      if (response.statusCode == 200) {
        return Dog.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

class Dog {
  final String image;

  Dog({required this.image});

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      image: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }
}

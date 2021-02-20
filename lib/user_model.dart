import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  String id;
  String name;

  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object){
    return User(
      id: object['id'].toString(),
      name: object['first_name'] + " " + object['last_name']
    );
  }

  static Future<User> connectToAPI(String id) async {
    String apiURL = "https://reqres.in/api/users/" + id;

    var apiResult = await http.get(apiURL);
    var jsonObject = jsonDecode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }
}
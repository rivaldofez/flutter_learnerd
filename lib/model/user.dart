import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String email;
  String firstname;
  String lastname;
  String avatar;

  User({this.id, this.email, this.firstname, this.lastname, this.avatar});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id: object["id"].toString(),
        email: object["email"],
        firstname: object["first_name"],
        lastname: object["last_name"],
        avatar: object["avatar"]);
  }

  static Future<User> getUserFromAPI(int id) async {
    String apiURL = "https://reqres.in/api/users/" + id.toString();

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }
}

class UninitializedUser extends User {}

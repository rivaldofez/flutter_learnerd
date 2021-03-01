import 'dart:convert';
import 'package:flutter_learnerd/person.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class PersonServices {
  static Future<Person> getPersonById(String id, http.Client client) async {
    String url = ".../persons/" + id;

    var response = await client.get(url);

    if(response.statusCode != 200) {
      throw Exception("error");
    }
    var result = json.decode(response.body);

    return Person.fromJson(result);
  }
}
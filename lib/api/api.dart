import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  Future<http.Response> postAPI(
      {required photos,
      required comment,
      required item,
      required area,
      required taskCategory,
      required tags,
      required events}) async {

    var body = jsonEncode(<String, String>{
      'photos': jsonEncode(photos),
      'comment': comment,
      'item': item,
      'area': area,
      'taskCategory': taskCategory,
      'tags': tags,
      'events': events,
    });
    return await http.post(
      Uri.parse('https://reqres.in/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
  }
}
// To parse this JSON data, do
//
//     final peopleListModel = peopleListModelFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart' as http;

PeopleListModel peopleListModelFromJson(String str) =>
    PeopleListModel.fromJson(json.decode(str));

String peopleListModelToJson(PeopleListModel data) =>
    json.encode(data.toJson());

class PeopleListModel {
  PeopleListModel({
    required this.id,
    required this.name,
    required this.username,
  });

  final int id;
  final String name;
  final String username;

  factory PeopleListModel.fromJson(Map<String, dynamic> json) =>
      PeopleListModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
      };

  static Future<List<PeopleListModel>?> fetchPeopleList() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/'),
    );

    if (response.statusCode == 200) {
      List<dynamic> lsDynamic = await jsonDecode(response.body);
      List<PeopleListModel> ls = List<PeopleListModel>.from(
        lsDynamic.map(
          (e) => PeopleListModel.fromJson(e),
        ),
      );

      return ls;
    } else {
      return null;
    }
  }
}

// To parse this JSON data, do
//
//     final exchangeRate = exchangeRateFromJson(jsonString);

import 'dart:convert';

List<ExchangeRate> exchangeRateFromJson(String str) => List<ExchangeRate>.from(
    json.decode(str).map((x) => ExchangeRate.fromJson(x)));

String exchangeRateToJson(List<ExchangeRate> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExchangeRate {
  ExchangeRate({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.layer,
    required this.datetime,
  });

  String id;
  String username;
  String firstname;
  String lastname;
  String email;
  String password;
  String layer;
  DateTime datetime;

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => ExchangeRate(
        id: json["id"],
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
        layer: json["layer"],
        datetime: DateTime.parse(json["datetime"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password,
        "layer": layer,
        "datetime": datetime.toIso8601String(),
      };
}

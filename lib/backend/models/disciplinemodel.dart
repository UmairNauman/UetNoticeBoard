// To parse this JSON data, do
//
//     final discipline = disciplineFromJson(jsonString);

import 'dart:convert';

Disciplinemodel disciplineFromJson(String str) =>
    Disciplinemodel.fromJson(json.decode(str));

String disciplineToJson(Disciplinemodel data) => json.encode(data.toJson());

class Disciplinemodel {
  Disciplinemodel({
    this.success,
    this.name,
    this.discipines,
  });

  String success;
  List<String> name;
  List<String> discipines;

  factory Disciplinemodel.fromJson(Map<String, dynamic> json) =>
      Disciplinemodel(
        success: json["success"],
        name: List<String>.from(json["name"].map((x) => x)),
        discipines: List<String>.from(json["Discipines"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "name": List<dynamic>.from(name.map((x) => x)),
        "Discipines": List<dynamic>.from(discipines.map((x) => x)),
      };
}

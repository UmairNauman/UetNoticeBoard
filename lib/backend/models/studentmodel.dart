// To parse this JSON data, do
//
//     final studentmodel = studentmodelFromJson(jsonString);

import 'dart:convert';

Studentmodel studentmodelFromJson(String str) =>
    Studentmodel.fromJson(json.decode(str));

String studentmodelToJson(Studentmodel data) => json.encode(data.toJson());

class Studentmodel {
  Studentmodel({
    this.success,
    this.name,
    this.studentAcademic,
  });

  String success;
  List<String> name;
  List<String> studentAcademic;

  factory Studentmodel.fromJson(Map<String, dynamic> json) => Studentmodel(
        success: json["success"],
        name: List<String>.from(json["name"].map((x) => x)),
        studentAcademic:
            List<String>.from(json["Student Academic"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "name": List<dynamic>.from(name.map((x) => x)),
        "Student Academic": List<dynamic>.from(studentAcademic.map((x) => x)),
      };
}

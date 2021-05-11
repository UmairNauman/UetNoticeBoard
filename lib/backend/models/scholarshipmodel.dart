import 'dart:convert';

Scholarshipmodel scholarshipmodelFromJson(String str) =>
    Scholarshipmodel.fromJson(json.decode(str));

String scholarshipmodelToJson(Scholarshipmodel data) =>
    json.encode(data.toJson());

class Scholarshipmodel {
  Scholarshipmodel({
    this.success,
    this.name,
    this.scholarship,
  });

  String success;
  List<String> name;
  List<String> scholarship;

  factory Scholarshipmodel.fromJson(Map<String, dynamic> json) =>
      Scholarshipmodel(
        success: json["success"],
        name: List<String>.from(json["name"].map((x) => x)),
        scholarship: List<String>.from(json["Scholarship"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "name": List<dynamic>.from(name.map((x) => x)),
        "Scholarship": List<dynamic>.from(scholarship.map((x) => x)),
      };
}

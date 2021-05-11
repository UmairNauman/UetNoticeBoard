// To parse this JSON data, do
//
//     final career = careerFromJson(jsonString);

import 'dart:convert';

Career careerFromJson(String str) => Career.fromJson(json.decode(str));

String careerToJson(Career data) => json.encode(data.toJson());

class Career {
  Career({
    this.success,
    this.name,
    this.careerDevelopment,
  });

  String success;
  List<String> name;
  List<String> careerDevelopment;

  factory Career.fromJson(Map<String, dynamic> json) => Career(
        success: json["success"],
        name: List<String>.from(json["name"].map((x) => x)),
        careerDevelopment:
            List<String>.from(json["careerDevelopment"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "name": List<dynamic>.from(name.map((x) => x)),
        "careerDevelopment":
            List<dynamic>.from(careerDevelopment.map((x) => x)),
      };
}

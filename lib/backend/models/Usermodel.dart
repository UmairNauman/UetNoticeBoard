import 'dart:convert';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
  Usermodel({
    this.success,
    this.imageUrl,
  });

  String success;
  List<String> imageUrl;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        success: json["success"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
      };
}

// To parse this JSON data, do
//
//     final aluminimodel = aluminimodelFromJson(jsonString);

import 'dart:convert';

Aluminimodel aluminimodelFromJson(String str) =>
    Aluminimodel.fromJson(json.decode(str));

String aluminimodelToJson(Aluminimodel data) => json.encode(data.toJson());

class Aluminimodel {
  Aluminimodel({
    this.success,
    this.commentData,
  });

  String success;
  List<CommentDatum> commentData;

  factory Aluminimodel.fromJson(Map<String, dynamic> json) => Aluminimodel(
        success: json["success"],
        commentData: List<CommentDatum>.from(
            json["commentData"].map((x) => CommentDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "commentData": List<dynamic>.from(commentData.map((x) => x.toJson())),
      };
}

class CommentDatum {
  CommentDatum({
    this.id,
    this.name,
    this.message,
    this.image,
  });

  String id;
  String name;
  String message;
  String image;

  factory CommentDatum.fromJson(Map<String, dynamic> json) => CommentDatum(
        id: json["id"],
        name: json["name"],
        message: json["message"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "message": message,
        "image": image,
      };
}

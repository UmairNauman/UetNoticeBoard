import 'dart:convert';

Noticeboardmodel noticeboardmodelFromJson(String str) =>
    Noticeboardmodel.fromJson(json.decode(str));

String noticeboardmodelToJson(Noticeboardmodel data) =>
    json.encode(data.toJson());

class Noticeboardmodel {
  Noticeboardmodel({
    this.success,
    this.name,
    this.notesboard,
  });

  String success;
  List<String> name;
  List<String> notesboard;

  factory Noticeboardmodel.fromJson(Map<String, dynamic> json) =>
      Noticeboardmodel(
        success: json["success"],
        name: List<String>.from(json["name"].map((x) => x)),
        notesboard: List<String>.from(json["notesboard"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "name": List<dynamic>.from(name.map((x) => x)),
        "notesboard": List<dynamic>.from(notesboard.map((x) => x)),
      };
}

import 'dart:convert';

Timetable timetableFromJson(String str) => Timetable.fromJson(json.decode(str));

String timetableToJson(Timetable data) => json.encode(data.toJson());

class Timetable {
  Timetable({
    this.success,
    this.name,
    this.timetables,
  });

  String success;
  List<String> name;
  List<String> timetables;

  factory Timetable.fromJson(Map<String, dynamic> json) => Timetable(
        success: json["success"],
        timetables: List<String>.from(json["Timetables"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "name": List<dynamic>.from(name.map((x) => x)),
        "Timetables": List<dynamic>.from(timetables.map((x) => x)),
      };
}

import 'dart:convert';

Eventsmodel eventsmodelFromJson(String str) =>
    Eventsmodel.fromJson(json.decode(str));

String eventsmodelToJson(Eventsmodel data) => json.encode(data.toJson());

class Eventsmodel {
  Eventsmodel({
    this.success,
    this.name,
    this.uetEvents,
  });

  String success;
  List<String> name;
  List<String> uetEvents;

  factory Eventsmodel.fromJson(Map<String, dynamic> json) => Eventsmodel(
        success: json["success"],
        name: List<String>.from(json["name"].map((x) => x)),
        uetEvents: List<String>.from(json["UET Events"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "name": List<dynamic>.from(name.map((x) => x)),
        "UET Events": List<dynamic>.from(uetEvents.map((x) => x)),
      };
}

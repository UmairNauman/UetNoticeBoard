import 'dart:convert';

Staffmodel staffmodelFromJson(String str) =>
    Staffmodel.fromJson(json.decode(str));

String staffmodelToJson(Staffmodel data) => json.encode(data.toJson());

class Staffmodel {
  Staffmodel({
    this.success,
    this.teacherInfo,
  });

  String success;
  List<TeacherInfo> teacherInfo;

  factory Staffmodel.fromJson(Map<String, dynamic> json) => Staffmodel(
        success: json["success"],
        teacherInfo: List<TeacherInfo>.from(
            json["Teacher info"].map((x) => TeacherInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "Teacher info": List<dynamic>.from(teacherInfo.map((x) => x.toJson())),
      };
}

class TeacherInfo {
  TeacherInfo({
    this.id,
    this.name,
    this.specialsubj,
    this.deparment,
    this.email,
    this.image,
  });

  String id;
  String name;
  String specialsubj;
  String deparment;
  String email;
  String image;

  factory TeacherInfo.fromJson(Map<String, dynamic> json) => TeacherInfo(
        id: json["id"],
        name: json["name"],
        specialsubj: json["specialsubj"],
        deparment: json["deparment"],
        email: json["email"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "specialsubj": specialsubj,
        "deparment": deparment,
        "email": email,
        "image": image,
      };
}

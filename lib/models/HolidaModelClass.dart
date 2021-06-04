// To parse this JSON data, do
//
//     final holidaymodel = holidaymodelFromJson(jsonString);

import 'dart:convert';

Holidaymodel holidaymodelFromJson(String str) => Holidaymodel.fromJson(json.decode(str));

String holidaymodelToJson(Holidaymodel data) => json.encode(data.toJson());

class Holidaymodel {
  Holidaymodel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<Datum> data;

  factory Holidaymodel.fromJson(Map<String, dynamic> json) => Holidaymodel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
   this.title,
    this.date,
  });

  int id;
  String title;
  DateTime date;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
  };
}

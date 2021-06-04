// To parse this JSON data, do
//
//     final loginClass = loginClassFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginClass loginClassFromJson(String str) => LoginClass.fromJson(json.decode(str));

String loginClassToJson(LoginClass data) => json.encode(data.toJson());

class LoginClass {
  LoginClass({
     this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  Data data;

  factory LoginClass.fromJson(Map<String, dynamic> json) => LoginClass(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );


  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
     this.userType,
    this.token,
    this.userProfile,
  });

  String userType;
  String token;
  List<UserProfile> userProfile;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userType: json["user_type"],
    token: json["token"],
    userProfile: List<UserProfile>.from(json["user_profile"].map((x) => UserProfile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user_type": userType,
    "token": token,
    "user_profile": List<dynamic>.from(userProfile.map((x) => x.toJson())),
  };
}

class UserProfile {
  UserProfile({
     this.empId,
     this.empFirstname,
     this.empLastname,
     this.empUsername,
     this.empPassword,
     this.empPhone,
     this.empEmail,
     this.empImage,
     this.empJoindate,
     this.empDepartment,
     this.empDesignation,
     this.empSalary,
     this.createdAt,
     this.updatedAt,
     this.id,
     this.desName,
     this.depId,
  });

  String empId;
  String empFirstname;
  String empLastname;
  String empUsername;
  String empPassword;
  String empPhone;
  String empEmail;
  String empImage;
  DateTime empJoindate;
  int empDepartment;
  int empDesignation;
  int empSalary;
  DateTime createdAt;
  dynamic updatedAt;
  int id;
  String desName;
  int depId;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    empId: json["emp_id"],
    empFirstname: json["emp_firstname"],
    empLastname: json["emp_lastname"],
    empUsername: json["emp_username"],
    empPassword: json["emp_password"],
    empPhone: json["emp_phone"],
    empEmail: json["emp_email"],
    empImage: json["emp_image"],
    empJoindate: DateTime.parse(json["emp_joindate"]),
    empDepartment: json["emp_department"],
    empDesignation: json["emp_designation"],
    empSalary: json["emp_salary"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    id: json["id"],
    desName: json["des_name"],
    depId: json["dep_id"],
  );

  Map<String, dynamic> toJson() => {
    "emp_id": empId,
    "emp_firstname": empFirstname,
    "emp_lastname": empLastname,
    "emp_username": empUsername,
    "emp_password": empPassword,
    "emp_phone": empPhone,
    "emp_email": empEmail,
    "emp_image": empImage,
    "emp_joindate": empJoindate.toIso8601String(),
    "emp_department": empDepartment,
    "emp_designation": empDesignation,
    "emp_salary": empSalary,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "id": id,
    "des_name": desName,
    "dep_id": depId,
  };
}


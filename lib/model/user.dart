// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    Status status;
    String message;
    Data data;

    User({
        required this.status,
        required this.message,
        required this.data,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        status: Status.fromJson(json["status"]),
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String id;
    String name;
    String email;
    String password;
    int role;
    DateTime born;
    String gender;
    String lastjob;
    String lastedu;
    String contact;
    String photolink;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic userJoinCourse;
    String dissability;
    String preference;
    dynamic applicant;
    dynamic certificationUser;

    Data({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.role,
        required this.born,
        required this.gender,
        required this.lastjob,
        required this.lastedu,
        required this.contact,
        required this.photolink,
        required this.createdAt,
        required this.updatedAt,
        required this.userJoinCourse,
        required this.dissability,
        required this.preference,
        required this.applicant,
        required this.certificationUser,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        born: DateTime.parse(json["born"]),
        gender: json["gender"],
        lastjob: json["lastjob"],
        lastedu: json["lastedu"],
        contact: json["contact"],
        photolink: json["photolink"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userJoinCourse: json["user_join_course"],
        dissability: json["dissability"],
        preference: json["preference"],
        applicant: json["applicant"],
        certificationUser: json["certification_user"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "role": role,
        "born": born.toIso8601String(),
        "gender": gender,
        "lastjob": lastjob,
        "lastedu": lastedu,
        "contact": contact,
        "photolink": photolink,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "user_join_course": userJoinCourse,
        "dissability": dissability,
        "preference": preference,
        "applicant": applicant,
        "certification_user": certificationUser,
    };
}

class Status {
    int code;
    bool isSuccess;

    Status({
        required this.code,
        required this.isSuccess,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        isSuccess: json["is_success"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "is_success": isSuccess,
    };
}

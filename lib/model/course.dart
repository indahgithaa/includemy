import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
    Status status;
    String message;
    Data data;

    Course({
        required this.status,
        required this.message,
        required this.data,
    });

    factory Course.fromJson(Map<String, dynamic> json) => Course(
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
    List<UserJoinCourse> userJoinCourse;
    String dissability;
    String preference;
    dynamic applicant;
    dynamic sertificationUser;
    dynamic orderCourse;
    dynamic orderSertification;

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
        required this.sertificationUser,
        required this.orderCourse,
        required this.orderSertification,
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
        userJoinCourse: List<UserJoinCourse>.from(json["user_join_course"].map((x) => UserJoinCourse.fromJson(x))),
        dissability: json["dissability"],
        preference: json["preference"],
        applicant: json["Applicant"],
        sertificationUser: json["sertification_user"],
        orderCourse: json["order_course"],
        orderSertification: json["order_sertification"],
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
        "user_join_course": List<dynamic>.from(userJoinCourse.map((x) => x.toJson())),
        "dissability": dissability,
        "preference": preference,
        "Applicant": applicant,
        "sertification_user": sertificationUser,
        "order_course": orderCourse,
        "order_sertification": orderSertification,
    };
}

class UserJoinCourse {
    String id;
    String userId;
    CourseClass course;
    String courseId;
    dynamic userSubcourse;
    DateTime createdAt;
    DateTime updatedAt;

    UserJoinCourse({
        required this.id,
        required this.userId,
        required this.course,
        required this.courseId,
        required this.userSubcourse,
        required this.createdAt,
        required this.updatedAt,
    });

    factory UserJoinCourse.fromJson(Map<String, dynamic> json) => UserJoinCourse(
        id: json["id"],
        userId: json["user_id"],
        course: CourseClass.fromJson(json["Course"]),
        courseId: json["course_id"],
        userSubcourse: json["UserSubcourse"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "Course": course.toJson(),
        "course_id": courseId,
        "UserSubcourse": userSubcourse,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class CourseClass {
    String id;
    String title;
    String teacher;
    String company;
    int price;
    String description;
    int howMuchTime;
    int howManyStudent;
    int howManyCourse;
    String tags;
    String dissability;
    String about;
    String photolink;
    dynamic subCourse;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic userJoinCourse;
    dynamic orderCourse;

    CourseClass({
        required this.id,
        required this.title,
        required this.teacher,
        required this.company,
        required this.price,
        required this.description,
        required this.howMuchTime,
        required this.howManyStudent,
        required this.howManyCourse,
        required this.tags,
        required this.dissability,
        required this.about,
        required this.photolink,
        required this.subCourse,
        required this.createdAt,
        required this.updatedAt,
        required this.userJoinCourse,
        required this.orderCourse,
    });

    factory CourseClass.fromJson(Map<String, dynamic> json) => CourseClass(
        id: json["id"],
        title: json["title"],
        teacher: json["teacher"],
        company: json["company"],
        price: json["price"],
        description: json["description"],
        howMuchTime: json["how_much_time"],
        howManyStudent: json["how_many_student"],
        howManyCourse: json["how_many_course"],
        tags: json["tags"],
        dissability: json["dissability"],
        about: json["about"],
        photolink: json["photolink"],
        subCourse: json["sub_course"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userJoinCourse: json["UserJoinCourse"],
        orderCourse: json["order_course"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "teacher": teacher,
        "company": company,
        "price": price,
        "description": description,
        "how_much_time": howMuchTime,
        "how_many_student": howManyStudent,
        "how_many_course": howManyCourse,
        "tags": tags,
        "dissability": dissability,
        "about": about,
        "photolink": photolink,
        "sub_course": subCourse,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "UserJoinCourse": userJoinCourse,
        "order_course": orderCourse,
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

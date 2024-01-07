import 'dart:convert';

class UserModel {
  int? id;
  String? phone;
  String? pushId;
  DateTime? birthday;
  String? name;
  String? surname;
  String? patronymic;
  String? country;
  String? email;
  String? sex;
  String? universityYearOfEntry;
  String? universityCourse;
  String? universityAcademicUnit;
  String? universityUnit;
  String? univeristyFaculty;
  String? contactPersonName;
  String? contactPersonSurname;
  String? contactPersonPatronymic;
  String? contactPersonPhone;
  String? contactPersonIsForMe;
  String? contactPersonEmail;
  DateTime? documentsDateOfArrival;
  DateTime? documentsDateOfVisaExpiring;
  DateTime? documentsDateOfPassportExpiring;
  int? hasTakenCourse;

  UserModel({
    this.id,
    this.phone,
    this.pushId,
    this.birthday,
    this.name,
    this.surname,
    this.patronymic,
    this.country,
    this.email,
    this.sex,
    this.universityYearOfEntry,
    this.universityCourse,
    this.universityAcademicUnit,
    this.universityUnit,
    this.univeristyFaculty,
    this.contactPersonName,
    this.contactPersonSurname,
    this.contactPersonPatronymic,
    this.contactPersonPhone,
    this.contactPersonIsForMe,
    this.contactPersonEmail,
    this.documentsDateOfArrival,
    this.documentsDateOfVisaExpiring,
    this.documentsDateOfPassportExpiring,
    this.hasTakenCourse,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        phone: json["phone"],
        pushId: json["push_id"],
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        name: json["name"],
        surname: json["surname"],
        patronymic: json["patronymic"],
        country: json["country"],
        email: json["email"],
        sex: json["sex"],
        universityYearOfEntry: json["universityYearOfEntry"],
        universityCourse: json["universityCourse"],
        universityAcademicUnit: json["universityAcademicUnit"],
        universityUnit: json["universityUnit"],
        univeristyFaculty: json["univeristyFaculty"],
        contactPersonName: json["contactPersonName"],
        contactPersonSurname: json["contactPersonSurname"],
        contactPersonPatronymic: json["contactPersonPatronymic"],
        contactPersonPhone: json["contactPersonPhone"],
        contactPersonIsForMe: json["contactPersonIsForMe"],
        contactPersonEmail: json["contactPersonEmail"],
        documentsDateOfArrival: json["documentsDateOfArrival"] == null
            ? null
            : DateTime.parse(json["documentsDateOfArrival"]),
        documentsDateOfVisaExpiring: json["documentsDateOfVisaExpiring"] == null
            ? null
            : DateTime.parse(json["documentsDateOfVisaExpiring"]),
        documentsDateOfPassportExpiring:
            json["documentsDateOfPassportExpiring"] == null
                ? null
                : DateTime.parse(json["documentsDateOfPassportExpiring"]),
        hasTakenCourse: json["hasTakenCourse"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "phone": phone ?? '',
        "push_id": pushId ?? '',
        "birthday": birthday != null
            ? "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}"
            : null,
        "name": name ?? '',
        "surname": surname ?? '',
        "patronymic": patronymic ?? '',
        "country": country ?? '',
        "email": email ?? '',
        "sex": sex ?? '',
        "universityYearOfEntry": universityYearOfEntry ?? '',
        "universityCourse": universityCourse ?? '',
        "universityAcademicUnit": universityAcademicUnit ?? '',
        "universityUnit": universityUnit ?? '',
        "univeristyFaculty": univeristyFaculty ?? '',
        "contactPersonName": contactPersonName ?? '',
        "contactPersonSurname": contactPersonSurname ?? '',
        "contactPersonPatronymic": contactPersonPatronymic ?? '',
        "contactPersonPhone": contactPersonPhone ?? '',
        "contactPersonIsForMe": contactPersonIsForMe ?? '',
        "contactPersonEmail": contactPersonEmail ?? '',
        "documentsDateOfArrival": documentsDateOfArrival != null
            ? "${documentsDateOfArrival!.year.toString().padLeft(4, '0')}-${documentsDateOfArrival!.month.toString().padLeft(2, '0')}-${documentsDateOfArrival!.day.toString().padLeft(2, '0')}"
            : null,
        "documentsDateOfVisaExpiring": documentsDateOfVisaExpiring != null
            ? "${documentsDateOfVisaExpiring!.year.toString().padLeft(4, '0')}-${documentsDateOfVisaExpiring!.month.toString().padLeft(2, '0')}-${documentsDateOfVisaExpiring!.day.toString().padLeft(2, '0')}"
            : null,
        "documentsDateOfPassportExpiring": documentsDateOfPassportExpiring !=
                null
            ? "${documentsDateOfPassportExpiring!.year.toString().padLeft(4, '0')}-${documentsDateOfPassportExpiring!.month.toString().padLeft(2, '0')}-${documentsDateOfPassportExpiring!.day.toString().padLeft(2, '0')}"
            : null,
        "hasTakenCourse": hasTakenCourse ?? 0,
      };
}

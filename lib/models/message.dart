import 'dart:convert';

class MessageModel {
  String? title;
  String? text;
  String? date;
  int? id;

  MessageModel({
    this.title,
    this.text,
    this.date,
    this.id,
  });

  factory MessageModel.fromRawJson(String str) =>
      MessageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        title: json["title"],
        text: json["message"],
        date: json["date"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() =>
      {"title": title, "message": text, "date": date, "id": id};
}

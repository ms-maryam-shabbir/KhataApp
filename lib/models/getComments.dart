// To parse this JSON data, do
//
//     final getComments = getCommentsFromJson(jsonString);

import 'dart:convert';

List<GetComments> getCommentsFromJson(String str) => List<GetComments>.from(json.decode(str).map((x) => GetComments.fromJson(x)));

String getCommentsToJson(List<GetComments> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetComments {
  GetComments({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  factory GetComments.fromJson(Map<String, dynamic> json) => GetComments(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}

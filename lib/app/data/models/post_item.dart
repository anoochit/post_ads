// To parse this JSON data, do
//
//     final postItem = postItemFromJson(jsonString);

import 'dart:convert';

List<PostItem> postItemFromJson(String str) =>
    List<PostItem>.from(json.decode(str).map((x) => PostItem.fromJson(x)));

String postItemToJson(List<PostItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostItem {
  int? id;
  User? user;
  String? content;
  String? type;
  DateTime? datetime;
  List<Ad>? ads;

  PostItem({
    this.id,
    this.user,
    this.content,
    this.type,
    this.datetime,
    this.ads,
  });

  factory PostItem.fromJson(Map<String, dynamic> json) => PostItem(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        content: json["content"],
        type: json["type"],
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        ads: json["ads"] == null
            ? []
            : List<Ad>.from(json["ads"]!.map((x) => Ad.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "content": content,
        "type": type,
        "datetime": datetime?.toIso8601String(),
        "ads":
            ads == null ? [] : List<dynamic>.from(ads!.map((x) => x.toJson())),
      };
}

class Ad {
  String? title;
  String? image;

  Ad({
    this.title,
    this.image,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
      };
}

class User {
  String? name;
  String? avatarUrl;

  User({
    this.name,
    this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        avatarUrl: json["avatarUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatarUrl": avatarUrl,
      };
}

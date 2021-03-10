import 'dart:convert';

List<MemesData> memesDataFromJson(String str) => List<MemesData>.from(json.decode(str).map((x) => MemesData.fromJson(x)));

String memesDataToJson(List<MemesData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MemesData {
  MemesData({
    this.id,
    this.url,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String url;
  int v;
  DateTime createdAt;
  DateTime updatedAt;

  factory MemesData.fromJson(Map<String, dynamic> json) => MemesData(
    id: json["_id"],
    url: json["url"],
    v: json["__v"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "url": url,
    "__v": v,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

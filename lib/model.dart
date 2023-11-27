import 'dart:convert';

List<SamplePosts> samplePostsFromJson(String str) => List<SamplePosts>.from(json.decode(str).map((x) => SamplePosts.fromJson(x)));

String samplePostsToJson(List<SamplePosts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SamplePosts {
  SamplePosts({
    required this.price,
    required this.id,
    required this.title,
    required this.category,
    required this.image
  });
  dynamic image;
  dynamic price;
  int id;
  String title;
  String category;

  factory SamplePosts.fromJson(Map<String, dynamic> json) => SamplePosts(
    image: json["show"]["image"] == null ? 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg' : json["show"]["image"]['original'],
    price: json["show"]["language"] == null ? "default" : json["show"]["language"],
    id: json["show"]["id"] == null ? 1: json["show"]["id"],
    title: json["show"]["name"] == null ? "No name" :json["show"]["name"] ,
    category: json["show"]["genres"][0] == null ? "random" : json["show"]["genres"][0],
  );

  Map<String, dynamic> toJson() => {
    "userId": price,
    "image":image,
    "id": id,
    "title": title,
    "body": category,
  };
}
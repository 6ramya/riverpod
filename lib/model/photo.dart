import 'dart:convert';

Photo photoFromJson(String str) => Photo.fromJson(json.decode(str));

class Photo {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photo({this.albumId, this.id, this.thumbnailUrl, this.title, this.url});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        albumId: json['albumId'],
        id: json['id'],
        thumbnailUrl: json['thumbnailUrl'],
        title: json['title'],
        url: json['url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'albumId': albumId,
      'id': id,
      'thumbnailUrl': thumbnailUrl,
      'title': title,
      'url': url
    };
  }
}

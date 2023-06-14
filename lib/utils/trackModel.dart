import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Track {
  String? name;
  String? artist;
  String? album;

  Track({required this.name, required this.artist, required this.album});

  Track.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    artist = json['artist'];
    album = json['album'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['artist'] = this.artist;
    data['album'] = this.album;
    return data;
  }
}

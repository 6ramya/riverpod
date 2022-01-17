import 'package:riverpod_demo/model/users.dart';

enum MediaType { image, video }

class Story {
  String? url;
  MediaType? media;
  Duration? duration;
  Users? user;

  Story({this.duration, this.media, this.url, this.user});
}

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:riverpod_demo/model/story_model.dart';
// import 'package:video_player/video_player.dart';

// class StoryScreen extends StatefulWidget {
//   const StoryScreen({Key? key, required this.stories}) : super(key: key);
//   final List<Story> stories;

//   @override
//   _StoryScreenState createState() => _StoryScreenState();
// }

// class _StoryScreenState extends State<StoryScreen> {
//   PageController? _pageController;
//   VideoPlayerController? _videoController;
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();

//     _videoController = VideoPlayerController.network(widget.stories[2].url!)
//       ..initialize().then((value) => setState(() {}));
//     _videoController!.play();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: PageView.builder(
//             controller: _pageController,
//             itemCount: widget.stories.length,
//             itemBuilder: (context, index) {
//               final Story story = widget.stories[index];
//               switch (story.media) {
//                 case MediaType.image:
//                   return CachedNetworkImage(
//                       imageUrl: story.url!, fit: BoxFit.cover);

//                 case MediaType.video:
//                   if (_videoController != null &&
//                       _videoController!.value.isInitialized) {
//                     return FittedBox(
//                       fit: BoxFit.cover,
//                       child: SizedBox(
//                         width: _videoController!.value.size.width,
//                         height: _videoController!.value.size.height,
//                       ),
//                     );
//                   }
//                   break;
//                 default:
//                   print('default case');
//               }
//               return const SizedBox.shrink();
//             }));
//   }
// }

import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final controller = StoryController();
  @override
  Widget build(BuildContext context) {
    return Material(
        child: StoryView(storyItems: [
      StoryItem.text(title: 'Hello ✋', backgroundColor: Colors.blue),
      StoryItem.pageImage(
          url:
              'https://images.unsplash.com/photo-1600115010857-edbbc7e1efb8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3VucmlzZSUyMGJlYWNofGVufDB8fDB8fA%3D%3D&w=1000&q=80',
          controller: controller),
      StoryItem.pageVideo(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          controller: controller)
    ], controller: controller, inline: false, repeat: false));
  }
}

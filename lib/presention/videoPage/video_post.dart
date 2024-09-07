import 'package:flutter/material.dart';
import 'package:social_app/widgets/video_post_widget.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Post'),
      ),
      body: ListView(
        children: const <Widget>[
          VideoPost(videoUrl: "https://www.w3schools.com/html/mov_bbb.mp4", userName: "Sujal")
        ],
      ),
    );
  }
}

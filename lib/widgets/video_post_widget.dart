import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  final String videoUrl;
  final String userName;

  const VideoPost({
    super.key,
    required this.videoUrl,
    required this.userName,
  });

  @override
  _VideoPostState createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  late VideoPlayerController _controller;
  bool _isLoading = true;
  String? _errorMessage;
  String postLink = "https://guideus.com/page/2";

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    try {
      await _controller.initialize();
      setState(() {
        _isLoading = false;
      });
      _controller.play();
      _controller.setLooping(true);
    } catch (error) {
      setState(() {
        _isLoading = false;
        _errorMessage = "Error loading video: $error";
      });
      print("Error initializing video player: $error");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sharePost() async {
    await Share.share("User shared a post from GuideUs \n $postLink");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(Icons.person, color: Colors.grey.shade600),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.userName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : _errorMessage != null
                      ? Text(_errorMessage!,
                          style: const TextStyle(color: Colors.red))
                      : AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: _sharePost,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

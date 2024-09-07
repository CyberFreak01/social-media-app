import 'package:flutter/material.dart';
import 'package:social_app/widgets/image_post_widget.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Posts'),
      ),
      body: ListView(
        children: const <Widget>[
          ImagePost(
              imageUrl:
                  "https://photographylife.com/cdn-cgi/imagedelivery/GrQZt6ZFhE4jsKqjDEtqRA/photographylife.com/2023/05/Nikon-Z8-Official-Samples-00002.jpg/w=960,h=640",
              userName: "Sujal"),
          ImagePost(
              imageUrl:
                  "https://photographylife.com/cdn-cgi/imagedelivery/GrQZt6ZFhE4jsKqjDEtqRA/photographylife.com/2023/05/Nikon-Z8-Official-Samples-00003.jpg/w=960,h=640",
              userName: "Samiksha")
        ],
      ),
    );
  }
}

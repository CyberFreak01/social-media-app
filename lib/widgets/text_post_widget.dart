import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:social_app/constants/constants.dart';

class TextPost extends StatelessWidget {
  final String userName;
  final String postContent;

  const TextPost({
    super.key,
    required this.userName,
    required this.postContent,
  });

  void _sharePost() async {
    String postLink = Constants.domain;
    await Share.share("User shared a post from GuideUs \n $postLink");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(Icons.person_2_rounded),
                  const SizedBox(width: 10),
                  Text(
                    userName,
                    style:const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                postContent,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon:const Icon(Icons.share),
                    onPressed: _sharePost,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

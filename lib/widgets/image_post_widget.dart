import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ImagePost extends StatelessWidget {
  final String imageUrl;
  final String userName;

  const ImagePost({
    super.key,
    required this.imageUrl,
    required this.userName,
  });

  void _sharePost() async {
      String postLink = "https://guideus.com/page/1";
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
                  userName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
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

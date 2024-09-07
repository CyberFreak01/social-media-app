import 'package:flutter/material.dart';
import 'package:social_app/widgets/text_post_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: const <Widget>[
          TextPost(
            userName: 'Sujal',
            postContent:
                'This is a sample post. Sharing something interesting!',
          ),
          TextPost(
            userName: 'Guide Us',
            postContent: 'Flutter is awesome! Check out this cool UI I built.',
          ),
        ],
      ),
    );
  }
}

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_app/presention/homepage/homepage.dart';
import 'package:social_app/presention/imagePage/image_post.dart';
import 'package:social_app/presention/videoPage/video_post.dart';

class Navbar extends StatefulWidget {
  Navbar({super.key, this.index = 0});
  int index;
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late final ConvexAppBar _controller;
  late int _selectedIndex;
  static List<Widget> _widgetOptions() {
    return [const HomePage(), const ImagePage(), const VideoPage()];
  }

  List<Widget> _buildScreens() {
    return [const HomePage(), const ImagePage(), const VideoPage()];
  }

  @override
  void initState() {
    // TODO: implement initState
    _selectedIndex = widget.index;
    _pageController = PageController(initialPage: widget.index);
    super.initState();
  }

  late PageController _pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
                _widgetOptions().length, (index) => _widgetOptions()[index])
            .toList(),
      ),
      bottomNavigationBar: ConvexAppBar(
        height: 50,
        initialActiveIndex: widget.index,
        backgroundColor: Colors.white,
        //controller: _controller,
        items: [
          TabItem(
              activeIcon: SvgPicture.asset(
                'assets/home.svg',
                fit: BoxFit.scaleDown,
                color: const Color(0xff243658),
              ),
              icon: SvgPicture.asset(
                'assets/home.svg',
              ),
              title: 'Home'),
          TabItem(
              activeIcon: SvgPicture.asset(
                'assets/image.svg',
                fit: BoxFit.scaleDown,
                color: const Color(0xff243658),
              ),
              icon: SvgPicture.asset(
                'assets/image.svg',
              ),
              title: 'Image'),
          TabItem(
              activeIcon: SvgPicture.asset(
                'assets/play.svg',
                fit: BoxFit.scaleDown,
                color: const Color(0xff243658),
              ),
              icon: SvgPicture.asset(
                'assets/play.svg',
              ),
              title: 'Video'),
        ],
        onTap: (index) {
          /// control your animation using page controller
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },

      ),
      backgroundColor: Colors.white,
    );
  }
}

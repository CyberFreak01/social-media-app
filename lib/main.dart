import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_app/presention/navbar/navbar.dart';
import 'package:app_links/app_links.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();

    initDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();

    super.dispose();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    // Handle links
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      log('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    if (uri.host == 'guideus.com' && uri.path.startsWith('/page')) {
      final bookId = uri.pathSegments.last; // Extract the book ID from the path
      _navigatorKey.currentState?.pushNamed('/page/$bookId');
    } else {
      _navigatorKey.currentState?.pushNamed(uri.fragment);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        Widget routeWidget = Navbar(
          index: 0,
        );

        // Mimic web routing
        final routeName = settings.name;
        if (routeName != null) {
          if (routeName.startsWith('/page/')) {
            // Navigated to /book/:id
            String indexStr = routeName.substring(
                routeName.indexOf('/page/') + 6); // "+ 6" skips "/page/"
            int index = int.parse(indexStr);
            log("This is index: $index");

            routeWidget = Navbar(
                index: index);
          } else if (routeName == '/page') {
            // Navigated to /book without other parameters
            routeWidget = Navbar(
              index: 0,
            );
          }
        }

        return MaterialPageRoute(
          builder: (context) => routeWidget,
          settings: settings,
          fullscreenDialog: true,
        );
      },
    );
  }
}

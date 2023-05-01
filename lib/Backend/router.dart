import 'package:flutter/material.dart';
import 'package:hackathon_gpt/Backend/edge_detection/edgescreen.dart';
import 'package:hackathon_gpt/Backend/image_text/lens.dart';
import 'package:hackathon_gpt/Frontend/screen/bottom_bar.dart';
import 'package:hackathon_gpt/Frontend/screen/chat.dart';
import 'package:hackathon_gpt/Frontend/screen/chat_history_screen.dart';
import 'package:hackathon_gpt/Frontend/screen/chatscreen.dart';
import 'package:hackathon_gpt/Frontend/screen/homescreen.dart';
import 'package:hackathon_gpt/Frontend/screen/image_screen.dart';
import 'package:hackathon_gpt/Frontend/screen/logInScreen.dart';
import 'package:hackathon_gpt/Frontend/screen/personal_info_screen.dart';
import 'package:hackathon_gpt/Frontend/screen/profile.dart';
import 'package:hackathon_gpt/Frontend/screen/secondScren.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case LoginPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginPage(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreen(),
      );
    case Chatscreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Chatscreen(),
      );
    case Chatscreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ChatScreenn(),
      );
    case SecondScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SecondScreen(),
      );
    case ImageScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ImageScreen(),
      );
    case ChatHistroyScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ChatHistroyScreen(),
      );
    case myProfile.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const myProfile(),
      );
    case PersonalInfo.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PersonalInfo(),
      );
    case ImageLens.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ImageLens(),
      );
    case EdgeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => EdgeScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}

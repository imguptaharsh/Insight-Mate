import 'package:flutter/material.dart';
import 'package:hackathon_gpt/Frontend/screen/chat.dart';
import 'package:hackathon_gpt/Frontend/screen/chat_history_screen.dart';
import 'package:hackathon_gpt/Frontend/screen/chatscreen.dart';
import 'package:hackathon_gpt/Frontend/screen/homescreen.dart';
import 'package:hackathon_gpt/Frontend/screen/image_screen.dart';
import 'package:hackathon_gpt/Frontend/screen/logInScreen.dart';
import 'package:hackathon_gpt/Frontend/screen/profile.dart';
import 'package:hackathon_gpt/Frontend/screen/secondScren.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
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
        builder: (_) => Chatscreen(),
      );
    case Chatscreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ChatScreenn(),
      );
    case SecondScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SecondScreen(),
      );
    case ImageScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ImageScreen(),
      );
    case ChatHistroyScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ChatHistroyScreen(),
      );
    case myProfile.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => myProfile(),
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

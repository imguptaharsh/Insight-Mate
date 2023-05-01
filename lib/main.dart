import 'package:hackathon_gpt/Frontend/screen/bottom_bar.dart';
import 'package:hackathon_gpt/Frontend/screen/frontScreen.dart';
import 'package:hackathon_gpt/Frontend/screen/homescreen.dart';
import 'package:hackathon_gpt/Frontend/screen/secondScren.dart';
import 'package:hackathon_gpt/Frontend/services/auth_service.dart';

import '../Backend/providers/models_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Backend/providers/images_provider.dart';
import 'Backend/providers/user_provider.dart';
import 'constants/constants.dart';
import '../Backend/providers/chats_provider.dart';
import 'Backend/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImagesProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context: context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ChatBOT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          appBarTheme: AppBarTheme(
            color: cardColor,
          )),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? BottomBar()
          : FrontScreen(),
    );
  }
}

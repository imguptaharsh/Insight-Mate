import 'package:flutter/material.dart';
import 'package:hackathon_gpt/Frontend/screen/secondScren.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({super.key});

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SecondScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff20262E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 250,
            width: 500,
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Chat GPT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromRGBO(2, 190, 146, 0.612)),
            ),
          ),
        ],
      ),
    );
  }
}

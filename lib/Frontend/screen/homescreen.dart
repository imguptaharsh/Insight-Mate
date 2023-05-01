import 'package:flutter/material.dart';
import '../widget/build_Card.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff20262E),
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              fit: BoxFit.cover,
              'assets/images/logo.png',
            )),
        title: const Text(
          'AI Assistants',
          style: TextStyle(
              fontFamily: 'Gotham',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 19),
        ),
        toolbarHeight: 70,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Writing',
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ),
            ),
            buildCard(
              image: Image.asset('assets/images/article.png'),
              heading: 'Write an Articles',
              textBody:
                  'Generate well-written\narticles on any\ntopic you want.',
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Creative',
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ),
            ),
            buildCard(
              image: Image.asset('assets/images/article.png'),
              heading: 'Write an Articles',
              textBody:
                  'Generate well-written\narticles on any\ntopic you want.',
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Business',
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ),
            ),
            buildCard(
              image: Image.asset('assets/images/article.png'),
              heading: 'Write an Articles',
              textBody:
                  'Generate well-written\narticles on any\ntopic you want.',
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Social Media',
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ),
            ),
            buildCard(
              image: Image.asset('assets/images/article.png'),
              heading: 'Write an Articles',
              textBody:
                  'Generate well-written\narticles on any\ntopic you want.',
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Developer',
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ),
            ),
            buildCard(
              image: Image.asset('assets/images/article.png'),
              heading: 'Write an Articles',
              textBody:
                  'Generate well-written\narticles on any\ntopic you want.',
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Personal',
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ),
            ),
            buildCard(
              image: Image.asset('assets/images/article.png'),
              heading: 'Write an Articles',
              textBody:
                  'Generate well-written\narticles on any\ntopic you want.',
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Others',
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ),
            ),
            buildCard(
              image: Image.asset('assets/images/article.png'),
              heading: 'Write an Articles',
              textBody:
                  'Generate well-written\narticles on any\ntopic you want.',
            )
          ],
        ),
      ),
    );
  }
}

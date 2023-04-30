import 'package:flutter/material.dart';

class ChatHistroyScreen extends StatelessWidget {
  static const routeName = '/history';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(184, 32, 34, 33),
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              fit: BoxFit.cover,
              'assets/images/logo.png',
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'History',
              style: TextStyle(
                  fontFamily: 'Gotham',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 19),
            ),
            const SizedBox(
              width: 50,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline_outlined))
          ],
        ),
        toolbarHeight: 70,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: ListView.builder(
        itemCount: 6, // replace with actual notification count
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            onDoubleTap: null,
            child: Card(
              color: Color.fromARGB(255, 58, 57, 57),
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              elevation: 0,
              child: ListTile(
                title: Text(
                  'Notification Title $index', // replace with actual notification title
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                subtitle: Text(
                  'Notification Message $index', // replace with actual notification message
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    )),
                onTap: () {
                  // TODO: Implement notification tap logic
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

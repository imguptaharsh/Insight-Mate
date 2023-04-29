import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/constants.dart';
import '../widget/chat_widget.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  final bool _istyping = true;
  late TextEditingController textEditingController;
  @override
  void initState() {
    // TODO: implement initState
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(60, 158, 158, 158),
          elevation: 2,
          leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ))),
          title: Text('CHATGPT'),
          centerTitle: true,
          actions: [],
        ),
        body: SafeArea(
          child: Column(children: [
            Flexible(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return MyWidget(
                      msg: chatMessages[index]["msg"].toString(),
                      chatIndex: int.parse(
                          chatMessages[index]["chatIndex"].toString()),
                    );
                  }),
            ),
            if (_istyping) ...[
              const SpinKitThreeBounce(
                color: Color.fromARGB(255, 247, 247, 247),
                size: 18,
              ),
              SizedBox(
                height: 15,
              ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(
                            color: Color.fromARGB(255, 249, 245, 245),
                          ),
                          controller: textEditingController,
                          onSubmitted: (value) {},
                          decoration: InputDecoration.collapsed(
                              hintText: "How can i help you",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 247, 245, 245))),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              )
            ]
          ]),
        ));
  }
}

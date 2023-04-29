import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackathon_gpt/Backend/constants/constants.dart';
import 'package:hackathon_gpt/Frontend/widget/chat_widget.dart';

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
    // ignore: todo
    // TODO: implement initState
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(60, 158, 158, 158),
          elevation: 2,
          leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ))),
          title: const Text('CHATGPT'),
          centerTitle: true,
          actions: const [],
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
              const SizedBox(
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
                          decoration: const InputDecoration.collapsed(
                              hintText: "How can i help you",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 247, 245, 245))),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
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

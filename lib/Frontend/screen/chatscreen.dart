import 'package:flutter/material.dart';

import '../widget/chat_widget.dart';

class ChatScreenn extends StatefulWidget {
  @override
  _ChatScreennState createState() => _ChatScreennState();
}

class _ChatScreennState extends State<ChatScreenn> {
  final TextEditingController _textController = TextEditingController();
  List<ChatMessage> _messages = [];

  // void _handleSubmitted(String text) {
  //   _textController.clear();
  //   ChatMessage message = ChatMessage(
  //     text: text,
  //     isUser: true,
  //   );
  //   setState(() {
  //     _messages.insert(0, message);
  //   });
  //   _getReply(text);
  // }

  void _handleSubmitted(String text) {
    if (text.isEmpty) {
      return;
    }
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    _getReply(text);
  }

  void _getReply(String text) {
    // logic to get reply from AI or chatbot
    ChatMessage message = ChatMessage(
      text: 'This is a reply from AI ',
      isUser: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff20262E),
      appBar: AppBar(
        title: const Text(
          'Chat AI',
          style: TextStyle(
            fontFamily: 'Gotham',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff20262E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add the code to navigate back to the previous screen
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(5.0),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (_, int index) => _messages[index],
              ),
            ),
            const Divider(height: 1.0),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: SizedBox(
                //height: 90,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xff17CE92),
                      radius: 25,
                      child: IconButton(
                        icon: const Icon(
                          Icons.mic,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // logic for mic button
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xff35383F),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 30, top: 10, bottom: 10),
                                child: TextField(
                                  controller: _textController,
                                  onSubmitted: _handleSubmitted,
                                  decoration: const InputDecoration.collapsed(
                                    hintText: 'Ask me anything...',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 167, 166, 166),
                                      fontFamily: 'Gotham',
                                    ),
                                    filled: true,

                                    // textAlign: TextAlign.center,
                                  ),
                                  style: const TextStyle(color: Colors.white),
                                  maxLines: null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: const Color(0xff17CE92),
                      radius: 25,
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () => _handleSubmitted(_textController.text),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.isUser});

  final String text;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment:
                isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                        color: isUser
                            ? const Color(0xff17CE92)
                            : const Color(0xff35383F),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(isUser ? 15.0 : 0),
                          bottomRight: Radius.circular(isUser ? 0 : 15.0),
                          topLeft: const Radius.circular(15.0),
                          topRight: const Radius.circular(15.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 5, bottom: 5, left: 5),
                        child: Text(
                          text,
                          style: TextStyle(
                            color: isUser ? Colors.white : Colors.white,
                            fontSize: 16.0,
                            fontFamily: 'Gotham',
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Visibility(
                        visible: !isUser,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(70),
                          onTap: () {
                            share();
                          },
                          child: const Icon(
                            Icons.share,
                            color: Color.fromARGB(117, 255, 255, 255),
                            size: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Visibility(
                        visible: !isUser,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(70),
                          onTap: () {},
                          child: const Icon(
                            Icons.mic,
                            color: Color.fromARGB(117, 255, 255, 255),
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 8.0),
        ],
      ),
    );
  }
}

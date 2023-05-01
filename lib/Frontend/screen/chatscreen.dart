// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../Backend/providers/chats_provider.dart';
import '../../Backend/providers/models_provider.dart';
import '../../Backend/widgets/text_widget.dart';
import '../widget/chat_widget.dart';

class ChatScreenn extends StatefulWidget {
  static const routeName = '/chat-screnn';
  @override
  _ChatScreennState createState() => _ChatScreennState();
}

class _ChatScreennState extends State<ChatScreenn> {
  bool _isTyping = false;
  bool _isListening = false;

  late TextEditingController textEditingController;
  late ScrollController _listScrollController;
  late FocusNode focusNode;
  @override
  void initState() {
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    final speech = stt.SpeechToText();
    double _buttonSize = 60;
    double _borderRadius = 30;
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
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     // Add the code to navigate back to the previous screen

        //   },
        // ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  padding: const EdgeInsets.all(5.0),
                  controller: _listScrollController,
                  // reverse: true,
                  itemCount: chatProvider.getChatList.length, //chatList.length,

                  itemBuilder: (context, index) {
                    return ChatMessage(
                      text: chatProvider
                          .getChatList[index].msg, // chatList[index].msg,
                      chatIndex: chatProvider.getChatList[index]
                          .chatIndex, //chatList[index].chatIndex,
                      // shouldAnimate:
                      //     chatProvider.getChatList.length - 1 == index,
                    );
                  }),
            ),
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
            ],
            const Divider(height: 1.0),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: SizedBox(
                //height: 90,
                child: Row(
                  children: [
                    //MIC STT
                    CircleAvatar(
                      backgroundColor: const Color(0xff17CE92),
                      radius: 25,
                      child: GestureDetector(
                        onTapUp: (details) {
                          speech.stop();
                          setState(() {
                            _isListening = false;
                            _buttonSize = 50.0;
                            _borderRadius = 25.0;
                          });
                        },
                        onTapDown: (details) async {
                          final isAvailable = await speech.initialize();
                          if (isAvailable) {
                            setState(() {
                              _isListening = true;
                              _buttonSize = 60.0;
                              _borderRadius = 30.0;
                            });
                            await speech.listen(
                              onResult: (result) {
                                textEditingController.text =
                                    result.recognizedWords;
                              },
                            );
                          }
                        },
                        //  child:  Icon(Icons.mic,color: _isListening ? Colors.blue : Colors.white,)
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 150),
                          width: _buttonSize,
                          height: _buttonSize,
                          decoration: BoxDecoration(
                            color: const Color(0xff17CE92),
                            borderRadius: BorderRadius.circular(_borderRadius),
                          ),
                          child: Icon(
                            _isListening ? Icons.mic : Icons.mic_none_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // child: IconButton(
                      //   icon: const Icon(
                      //     Icons.mic,
                      //     color: Colors.white,
                      //   ),
                      //   onPressed: () {
                      //     // logic for mic button
                      //   },
                      // ),
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
                                  controller: textEditingController,
                                  onSubmitted: (value) async {
                                    await sendMessageFCT(
                                        modelsProvider: modelsProvider,
                                        chatProvider: chatProvider);
                                  },
                                  decoration: const InputDecoration.collapsed(
                                    hintText: 'How can I help you',
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
                        onPressed: () async {
                          await sendMessageFCT(
                              modelsProvider: modelsProvider,
                              chatProvider: chatProvider);
                        },
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

  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT(
      {required ModelsProvider modelsProvider,
      required ChatProvider chatProvider}) async {
    if (_isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "You cant send multiple messages at a time",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "Please type a message",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    try {
      String msg = textEditingController.text;
      setState(() {
        _isTyping = true;
        chatProvider.addUserMessage(msg: msg);
        textEditingController.clear();
        focusNode.unfocus();
      });
      await chatProvider.sendMessageAndGetAnswers(
          msg: msg, chosenModelId: modelsProvider.getCurrentModel);

      setState(() {});
    } catch (error) {
      log("error $error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollListToEND();
        _isTyping = false;
      });
    }
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({
    required this.text,
    required this.chatIndex,
  });

  final String text;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment:
            (chatIndex == 0) ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: (chatIndex == 0)
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                        color: (chatIndex == 0)
                            ? const Color(0xff17CE92)
                            : const Color(0xff35383F),
                        borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular((chatIndex == 0) ? 15.0 : 0),
                          bottomRight:
                              Radius.circular((chatIndex == 0) ? 0 : 15.0),
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
                            color:
                                (chatIndex == 0) ? Colors.white : Colors.white,
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
                        visible: !(chatIndex == 0),
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
                        visible: !(chatIndex == 0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(70),
                          onTap: () async {
                            FlutterTts flutterTts = FlutterTts();
                            flutterTts.setLanguage("en-US");
                            flutterTts.setPitch(1.0);
                            flutterTts.setSpeechRate(0.5);
                            await flutterTts.speak(
                              text.toString(),
                            );
                          },
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

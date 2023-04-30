import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../Backend/widgets/text_widget.dart';
import 'package:whatsapp_share/whatsapp_share.dart';
// import 'package:text_to_speech/text_to_speech.dart';
import '../../constants/constants.dart';

class MyWidget extends StatefulWidget {
  // const MyWidget({super.key});
  final String msg;
  final int chatIndex;
  final bool shouldAnimate;

  const MyWidget({
    Key? key,
    required this.msg,
    required this.chatIndex,
    required this.shouldAnimate,
  }) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

Future<void> share() async {
  await WhatsappShare.share(
    text: 'Whatsapp share text',
    linkUrl: 'https://flutter.dev/',
    phone: '911234567890',
  );
}

void sendWhatsapp() {
  // ignore: unused_local_variable
  String url = "whatsapp://send?phone=+919650845408&text=${Uri.parse("hello")}";
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: widget.chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    widget.chatIndex == 0
                        ? 'https://static.vecteezy.com/system/resources/previews/021/608/790/original/chatgpt-logo-chat-gpt-icon-on-black-background-free-vector.jpg'
                        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmL_db62k8JH_uZuQi3IWja7VdudVSJAf6fIC7bPadex8GmodDpBFO7MLHpquflN_KS0o&usqp=CAU',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: widget.chatIndex == 0
                      ? TextWidget(
                          label: widget.msg,
                        )
                      : widget.shouldAnimate
                          ? DefaultTextStyle(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                              child: AnimatedTextKit(
                                  isRepeatingAnimation: false,
                                  repeatForever: false,
                                  displayFullTextOnTap: true,
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      widget.msg.trim(),
                                    ),
                                  ]),
                            )
                          : Text(
                              widget.msg.trim(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                ),
                widget.chatIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              FlutterTts flutterTts = FlutterTts();
                              flutterTts.setLanguage("en-US");
                              flutterTts.setPitch(1.5);
                              flutterTts.setSpeechRate(1);
                              await flutterTts.speak(
                                widget.msg.toString(),
                              );
                            },
                            child: const Icon(
                              Icons.mic,
                              color: Color.fromARGB(255, 136, 136, 136),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.share,
                            color: Color.fromARGB(255, 136, 136, 136),
                          )
                        ],
                      ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

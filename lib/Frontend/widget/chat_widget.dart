import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hackathon_gpt/widget/text_widget.dart';
import 'package:whatsapp_share/whatsapp_share.dart';

import '../constants/constants.dart';

class MyWidget extends StatefulWidget {
  // const MyWidget({super.key});
  final String msg;
  final int chatIndex;
  const MyWidget({super.key, required this.msg, required this.chatIndex});

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
  String url = "whatsapp://send?phone=+919650845408&text=${Uri.parse("hello")}";
  //launchUrl(Uri.parse(url));
  //launchUrl(Uri.parse(url));
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
                    // Image.network(

                    widget.chatIndex == 0
                        ? 'https://static.vecteezy.com/system/resources/previews/021/608/790/original/chatgpt-logo-chat-gpt-icon-on-black-background-free-vector.jpg'
                        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmL_db62k8JH_uZuQi3IWja7VdudVSJAf6fIC7bPadex8GmodDpBFO7MLHpquflN_KS0o&usqp=CAU',
                    // height: 30,
                    // width: 30,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(child: TextWidget(label: widget.msg)),
                widget.chatIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                share();
                              },
                              icon: Icon(
                                Icons.share,
                                color: Colors.white,
                              )),
                          // SizedBox(
                          //   width: 5,
                          // ),
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

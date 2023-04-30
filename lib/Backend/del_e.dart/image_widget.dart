import 'package:flutter/material.dart';

import '../../Frontend/widget/text_widget.dart';
import '../../constants/constants.dart';
import '../../assets_manager.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget(
      {super.key,
      required this.msg,
      required this.chatIndex,
      this.shouldAnimate = false});

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0 ? AssetsManager.logo : AssetsManager.logo,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: chatIndex == 0
                      ? TextWidget(
                          label: msg,
                        )
                      : Container(
                          child: Image.network(
                            msg,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                  // : shouldAnimate
                  //     ? DefaultTextStyle(
                  //         style: const TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w700,
                  //             fontSize: 16),
                  //         child: AnimatedTextKit(
                  //             isRepeatingAnimation: false,
                  //             repeatForever: false,
                  //             displayFullTextOnTap: true,
                  //             totalRepeatCount: 1,
                  //             animatedTexts: [
                  //               TyperAnimatedText(
                  //                 msg.trim(),
                  //               ),
                  //             ]),
                  //       )
                  //     : Text(
                  //         msg.trim(),
                  //         style: const TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w700,
                  //             fontSize: 16),
                  //       ),
                ),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

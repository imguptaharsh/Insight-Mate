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
            padding: const EdgeInsets.all(18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    chatIndex == 0 ? AssetsManager.logo : AssetsManager.logo,
                    height: 30,
                    width: 30,
                  ),
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
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Image.network(
                              msg,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                ),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: const [],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

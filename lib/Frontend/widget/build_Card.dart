import 'package:flutter/material.dart';
import '../const.dart';

class buildCard extends StatelessWidget {
  final Image image;
  final String heading;
  final String textBody;
  const buildCard({
    super.key,
    required this.image,
    required this.heading,
    required this.textBody,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: 1000,
          separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
          itemBuilder: (context, index) {
            return Card(
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: const Color.fromARGB(168, 86, 85, 85),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                      margin: const EdgeInsets.all(15),
                      elevation: 0,
                      borderOnForeground: true,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: SizedBox(height: 70, width: 70, child: image)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5),
                    child: Text(
                      heading,
                      softWrap: true,
                      style: const TextStyle(
                          fontFamily: 'Gotham',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5),
                    child: Text(
                      textBody,
                      style: const TextStyle(
                          letterSpacing: 0.2,
                          wordSpacing: 0.6,
                          fontFamily: 'Gotham',
                          color: Color.fromARGB(152, 228, 220, 220),
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      softWrap: true,
                      maxLines: 20,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

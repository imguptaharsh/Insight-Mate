import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

late File imageFile;

class BottomShhetWidget extends StatefulWidget {
  @override
  _BottomShhetWidgetState createState() => _BottomShhetWidgetState();
}

class _BottomShhetWidgetState extends State<BottomShhetWidget> {
  void takePhotoByCamera() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      imageFile = image as File;
    });
  }

  void takePhotoByGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = image as File;
    });
  }

  void removePhoto() {
    setState(() {
      imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(208, 0, 0, 0),
      height: 250.0,
      width: 250.0,
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "Profile photo",
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w700,
                  color: Colors.grey),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                TextButton.icon(
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    color: Color.fromARGB(255, 175, 166, 166),
                  ),
                  onPressed: takePhotoByCamera,
                  label: const Text(
                    "Camera",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20.0),
                ),
                TextButton.icon(
                  icon: const Icon(
                    Icons.image,
                    color: Color.fromARGB(255, 175, 166, 166),
                  ),
                  onPressed: takePhotoByGallery,
                  label: const Text(
                    "Gallery",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 40.0, top: 10.0),
            child: Row(
              children: <Widget>[
                TextButton.icon(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: removePhoto,
                  label: const Text(
                    "Remove",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

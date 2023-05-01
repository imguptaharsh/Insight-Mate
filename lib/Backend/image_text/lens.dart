import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import '../services/services.dart';

class ImageLens extends StatefulWidget {
  static const routeName = '/image-lens';
  const ImageLens({super.key});

  @override
  State<ImageLens> createState() => _ImageLensState();
}

class _ImageLensState extends State<ImageLens> {
  bool textScanning = false;
  XFile? imageFile;

  String scannedText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff20262E),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Text Detector',
          style: TextStyle(
              fontFamily: 'Gotham',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 19),
        ),
        toolbarHeight: 70,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        actions: [
          IconButton(
            onPressed: () async {
              await Services.showModalSheet(context: context);
            },
            icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
          ),
        ],
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (textScanning) const CircularProgressIndicator(),
          if (!textScanning && imageFile == null)
            if (imageFile != null) Image.file(File(imageFile!.path)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 80,
                  width: 130,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.grey,
                      backgroundColor: const Color.fromARGB(185, 40, 42, 39),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.image,
                            size: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Gallery",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Container(
                  height: 80,
                  width: 130,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.grey,
                      backgroundColor: const Color.fromARGB(185, 40, 42, 39),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    onPressed: () {
                      getImage(ImageSource.camera);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.camera_alt,
                            size: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              "Camera",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              scannedText,
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Gotham',
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ))),
    );
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = const Text(
        'Error occured while scanning',
        style: TextStyle(color: Colors.redAccent),
      ) as String;

      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = "$scannedText${line.text}\n";
      }
    }
    print(scannedText.toString());

    textScanning = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }
}

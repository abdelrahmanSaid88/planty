import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:planty/components/appbar_text_style.dart';
import 'package:planty/components/my_theme_colors.dart';
import 'package:planty/machineLearning/components/show_button_sheet.dart';
import 'package:planty/screens/diseases/early_blight.dart';
import 'package:planty/screens/diseases/powdery_mildew.dart';
import 'package:planty/screens/diseases/rust.dart';
import 'package:tflite/tflite.dart';

class scanResult extends StatefulWidget {
  static const routeName = 'Scan Result>';

  @override
  _scanResultState createState() => _scanResultState();
}
class _scanResultState extends State<scanResult> {
  List? _outputs;
  File? _image;
  bool _loading = false;
  String result = '';
  ImagePicker _picker = ImagePicker();
  int? _position = 0;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
    _loading = true;
    loadModel();
  }

  loadModel() async {
    String? res = await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
        numThreads: 1,
        // defaults to 1
        isAsset: true,
        // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          backgroundColor: MyThemeColors.mainDarkGreen,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 30, color: MyThemeColors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          title:
              Text('Plants Scanning', style: appBarStyle(MyThemeColors.white)),
          centerTitle: true,
        ),

        body: Container(
          width: 400,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                _image == null ? Container() : Image.file(_image!),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  result,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    background: Paint()..color = Colors.white,
                  ),
                ),
                _image == null
                    ? Container()
                    :  Container(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        child: Column(
                          children: [
                            RadioListTile(
                              title: const Text(
                                ' Powdery Mildew',
                                style: TextStyle(color: Colors.black),
                              ),
                              value: 1,
                              groupValue: _position,
                              onChanged: (value) => setState(() {
                                _position = value as int?;
                              }),
                            ),
                            RadioListTile(
                              title: const Text(
                                ' Early blight',
                                style: TextStyle(color: Colors.black),
                              ),
                              value: 2,
                              groupValue: _position,
                              onChanged: (value) => setState(() {
                                _position = value as int?;
                              }),
                            ),
                            RadioListTile(
                              title: const Text(
                                ' Rust',
                                style: TextStyle(color: Colors.black),
                              ),
                              value: 3,
                              groupValue: _position,
                              onChanged: (value) => setState(() {
                                _position = value as int?;
                              }),
                            ),
                            FlatButton(
                              onPressed: () {
                                onButtonClick();
                              },
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                              child: const Text(
                                " More Details",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: MyThemeColors.mainDarkGreen,
                            )
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyThemeColors.mainDarkGreen,
          onPressed: showDialog,
          child:SvgPicture.asset("assets/images/ic_scan.svg"),
        ),
      ),
    );
  }

  classifyImage(File image) async {
    var recognitions = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 127.5,
        // defaults to 117.0
        imageStd: 127.5,
        // defaults to 1.0
        numResults: 2,
        // defaults to 5
        threshold: 0.5,
        // defaults to 0.1
        asynch: true // defaults to 0.1
        );
    print(recognitions!.length.toString());
    setState(() {
      result = "";
    });
    recognitions.forEach((re) {
      setState(() {
        print(re.toString());
        result += re["label"] +
            " " +
            (re["confidence"] as double).toStringAsFixed(2) +
            "\n";
      });
    });
  }

  Future _imgFromCamera() async {
    try {
      var image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return;
      setState(() {
        _loading = true;
        _image = File(image.path);
      });
      classifyImage(_image!);
    } catch (e) {
      setState(() {
        print(' you have problem $e');
      });
    }
  }

  Future _imgFromGallery() async {
    try {
      var image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      setState(() {
        _loading = true;
        _image = File(image.path);
      });
      classifyImage(_image!);
    } catch (e) {
      setState(() {
        print(' you have problem $e');
      });
    }
  }

  showDialog() {
    showCupertinoModalPopup(
        context: context,
        builder: (buildeContext) {
          return ShowBottomSheet(
            pickFromCamera: _imgFromCamera,
            pickFromGallery: _imgFromGallery,
          );
        });
  }

  onButtonClick() {
    switch (_position) {
      case 1:
        {
          Navigator.pushNamed(context, powderyMildew.routeName);
        }
        break;
      case 2:
        {
          Navigator.pushNamed(context, earlyBlight.routeName);
        }
        break;
      case 3:
        {
          Navigator.pushNamed(context, Rust.routeName);
        }
        break;
    }
  }
}

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:objectdetection/Login/Login.dart';
import 'package:objectdetection/Sign%20Up/SignUp.dart';
import 'package:objectdetection/Splash%20Screen.dart';
import 'package:objectdetection/camerapage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(OurSignUp());
}

class FlutterVisionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Object Detection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imgPath;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Flutter ml vision"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Container(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: _imagelist(),
                ),
              ),
            )),
            IconButton(
                icon: Icon(Icons.av_timer_sharp),
                onPressed: () async {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(
                    builder: (context) => CameraApp(),
                  ));
                })
          ],
        ),
      ),
    );
  }

  Widget _imagelist() {
    return GestureDetector(
      child: Center(
        child: Image.asset("lib/assets/car.jpg"),
      ),
      onTap: () async {
        print("Trying to detect Image");
        String file = await getImageFileFromAssets("car.jpg");
        print(file);
        setState(() {
          imgPath = file;
        });
        //detectLabels();
      },
    );
  }

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  Future<String> getImageFileFromAssets(String path) async {
    final bytedata = await rootBundle.load("lib/assets/$path");
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/pictures/fluttervision';
    await Directory(dirPath).create(recursive: true);
    final String filePath =
        '$dirPath/${DateTime.now().microsecondsSinceEpoch.toString()}.jpg';
    final file = File(filePath);
    await file.writeAsBytes(bytedata.buffer
        .asUint8List(bytedata.offsetInBytes, bytedata.lengthInBytes));
    return filePath;
  }

  Future<void> detectLabels() async {
    final ImageLabeler cloudLabeler =
        FirebaseVision.instance.cloudImageLabeler();
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFilePath(imgPath);
    final ImageLabeler labelDetector = FirebaseVision.instance
        .imageLabeler(ImageLabelerOptions(confidenceThreshold: 0.25));
    final List<ImageLabel> labels =
        await labelDetector.processImage(visionImage);
    //final List<ImageLabel> cloudLabels =
    //  await cloudLabeler.processImage(visionImage);

    for (ImageLabel label in labels) {
      final String text = label.text;
      final String entityId = label.entityId;
      final double confidence = label.confidence;
      print(text);
      print(confidence);
      print(entityId);
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
    }
  }
}

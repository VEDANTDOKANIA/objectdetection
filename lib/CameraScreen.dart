import 'dart:io';
import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

String imgPath;

class PreviewImageScreen extends StatefulWidget {
  final String imagePath;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PreviewImageScreen({this.imagePath});

  @override
  _PreviewImageScreenState createState() => _PreviewImageScreenState();
}

class _PreviewImageScreenState extends State<PreviewImageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Preview'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _imagelist(File(widget.imagePath)),
          ],
        ),
      ),
    );
  }

  Widget _imagelist(var a) {
    return GestureDetector(
      child: Center(
        child: Image.file(File(widget.imagePath)),
      ),
      onTap: () async {
        print("Trying to detect Image");
        // String file = await getImageFileFromAssets(a);
        // print(file);
        setState(() {
          //   imgPath = file;
        });
        //detectLabels(file);
      },
    );
  }
/*
  Future<void> detectLabels(file) async {
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFilePath(file);
    //final LabelDetector labelDetector = FirebaseVision.instance.labelDetector();
    //final List<Label> labels = await labelDetector.detectInImage(visionImage);

    for (Label label in labels) {
      final String text = label.label;
      final String entityId = label.entityId;
      final double confidence = label.confidence;
      print(text);
      print(confidence);
      print(entityId);
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
    }
  }

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  Future<ByteData> getBytesFromFile() async {
    Uint8List bytes = File(widget.imagePath).readAsBytesSync() as Uint8List;
    return ByteData.view(bytes.buffer);
  }

  Future<String> getImageFileFromAssets(String path) async {
    final bytedata = getBytesFromFile();
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/pictures/fluttervision';
    await Directory(dirPath).create(recursive: true);
    final String filePath =
        '$dirPath/${DateTime.now().microsecondsSinceEpoch.toString()}.jpg';
    final file = File(filePath);
    return filePath;
  }*/
}

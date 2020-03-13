import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageCapture extends StatefulWidget {
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  void _clear() {
    setState(() {
      _imageFile = null;
    });
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: "Upload your ID",
            toolbarColor: Theme.of(context).accentColor),
        iosUiSettings: IOSUiSettings(title: "Upload your ID"));

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () => _pickImage(ImageSource.camera),
          ),
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () => _pickImage(ImageSource.gallery),
          )
        ],
      ),
    ),
    body: ListView(
      children: <Widget>[
        if(_imageFile != null) ...[
          Image.file(_imageFile),
          Row(children: <Widget>[
            FlatButton(
              onPressed: _cropImage,
              child: Icon(Icons.crop),
            ),
            FlatButton(
              onPressed: _clear,
              child: Icon(Icons.refresh),
            ),
            // Uploader(file: _imageFile)
          ],)
        ]
      ],
    ));
  }
}

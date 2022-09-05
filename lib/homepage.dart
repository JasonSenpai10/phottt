import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'DBHelper.dart';
import 'Utility.dart';

import 'Photo.dart';
import 'dart:async';

class Homepage extends StatefulWidget {
  //
  Homepage() : super();

  final String title = "Flutter Save Image";

  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  //
  late Future<File> imageFile;
  late Image image;
  // late DataBaseHelper dataBaseHelper;
  late List<Photo> images;

  @override
  void initState() {
    super.initState();
    images = [];
    // dataBaseHelper = DataBaseHelper();
    //refreshImages();
  }

  // refreshImages() {
  //   dataBaseHelper.getPhotos().then((imgs) {
  //     setState(() {
  //       images.clear();
  //       //images.addAll(imgs);
  //     });
  //   });
  // }

  pickImageFromGallery() async {
    var imgFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    final bytes = await imgFile!.readAsBytes();
    final base64 = base64Encode(bytes);

    print(base64);
    // await ImagePicker().pickImage(source: ImageSource.gallery)
    // .then((imgFile) {
    //   //print(imgFile);

    //   // String imgString = Utility.base64String(imgFile.readAsBytesSync());
    //   // Photo photo = Photo(0, imgString);
    //   // dataBaseHelper.save(photo);
    //   // refreshImages();
    // });
  }

  gridView() {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: images.map((photo) {
          return Utility.imageFromBase64String(photo.name);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              pickImageFromGallery();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: gridView(),
            )
          ],
        ),
      ),
    );
  }
}

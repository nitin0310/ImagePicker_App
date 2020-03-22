import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  File pickedImage;
  var filePath;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pick an image"),
        ),

        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 300.0,
              width: 300.0,
              child: pickedImage == null?Center(child: Text("Select an image to show"),):showImage()
            ),
          ),
        ),

        persistentFooterButtons: <Widget>[
          Container(
            width: 80.0,
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(Icons.camera),
              onPressed: (){
                pickImage(ImageSource.camera);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),

          FloatingActionButton(
            child: Icon(Icons.crop_original),
            onPressed: (){
              pickImage(ImageSource.gallery);
            },
          ),
          
          FloatingActionButton(
            child: Icon(Icons.file_download),
            backgroundColor: Colors.red[800],
            onPressed: (){

            },
          )
        ],
      ),
    );
  }

  Future<File> pickImage(ImageSource source) async{
    File testImage = await ImagePicker.pickImage(source: source);
    setState(() {
      pickedImage = testImage;
    });
  }

  Widget showImage(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(pickedImage,fit: BoxFit.contain,),
            ),
          ),
    );
  }

}

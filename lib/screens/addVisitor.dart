import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart' as Im;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:SAKEC_GATE/global.dart' as global;

class AddVisitor extends StatefulWidget {
  @override
  _AddVisitorState createState() => _AddVisitorState();
}

class _AddVisitorState extends State<AddVisitor>
    with AutomaticKeepAliveClientMixin<AddVisitor> {
  File file;
  bool isUploading = false;
  String visitorID = Uuid().v4();
  final DateTime timestamp = DateTime.now();
  final CollectionReference visitorCollection =
      Firestore.instance.collection('visitors');
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController purpose = TextEditingController();
  TextEditingController staff = TextEditingController();

  handleTakePhoto() async {
    Navigator.pop(context);
    File file = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 675,
      maxWidth: 960,
    );
    setState(() {
      this.file = file;
    });
  }

  /* handleChooseFromGallery() async {
    Navigator.pop(context);
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.file = file;
    });
  } */

  selectImage(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
          title: Text("Create Post"),
          children: <Widget>[
            SimpleDialogOption(
                child: Text("Photo with Camera"), onPressed: handleTakePhoto),
            /* SimpleDialogOption(
                child: Text("Image from Gallery"),
                onPressed: handleChooseFromGallery), */
            SimpleDialogOption(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }

  String dropDown = "whom to meet";

  Container buildSplashScreen() {
    return Container(
      color: Theme.of(context).accentColor.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Image.asset('assets/images/upload.gif', height: 260.0),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "Upload Image",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
                color: Colors.deepOrange,
                onPressed: () => selectImage(context)),
          ),
        ],
      ),
    );
  }

  clearImage() {
    setState(() {
      file = null;
    });
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img_$visitorID.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }

  Future<String> uploadImage(imageFile) async {
    StorageUploadTask uploadTask =
        FirebaseStorage().ref().child("post_$visitorID.jpg").putFile(imageFile);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createVisitorInFirestore(
      {String mediaUrl,
      String name,
      String phone,
      String purpose,
      String staff}) {
    visitorCollection.document(visitorID).setData({
      "visitorID": visitorID,
      "mediaURL": mediaUrl,
      "name": name,
      "phone": phone,
      "purpose": purpose,
      "staff": staff,
      "timestamp": timestamp,
    });
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    await compressImage();
    String mediaUrl = await uploadImage(file);
    createVisitorInFirestore(
        mediaUrl: mediaUrl,
        name: name.text,
        phone: phone.text,
        purpose: purpose.text,
        staff: staff.text);
    setState(() {
      file = null;
      isUploading = false;
      visitorID = Uuid().v4();
    });
  }

  Scaffold buildUploadForm() {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white70,
        /* leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: clearImage), */
        title: Text(
          "Add Visitor",
          style: TextStyle(color: Colors.black),
        ),
        /* actions: [
          FlatButton(
            onPressed: isUploading ? null : () => handleSubmit(),
            child: Text(
              "Post",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ], */
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        children: <Widget>[
          isUploading ? linearProgress() : Text(""),
          CircleAvatar(
            radius: 100,
            child: file != null
                ? Center(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(file),
                        ),
                      ),
                    ),
                  )
                : Icon(Icons.person_add),
          ),
          SizedBox(height: 15),
          SizedBox(height: 20),
          TextFormField(
            //style: TextStyle(color: Colors.white),
            controller: name,
            decoration: InputDecoration(
              labelText: "Name",
              contentPadding: EdgeInsets.all(8),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            //style: TextStyle(color: Colors.white),
            controller: phone,
            decoration: InputDecoration(
              labelText: "Phone Number",
              contentPadding: EdgeInsets.all(8),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            //style: TextStyle(color: Colors.white),
            controller: purpose,
            decoration: InputDecoration(
              labelText: "Purpose to Visit",
              contentPadding: EdgeInsets.all(8),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 15),
          DropdownButton(
            //value: global.staff[0].fullName, 
              items: global.staff.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value.fullName,
                  child: Text(value.fullName),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  staff.text = newValue;
                });
              },
              iconSize: 24,
              elevation: 16,
              icon: Icon(Icons.arrow_downward)),
          /* TextFormField(
            //style: TextStyle(color: Colors.white),
            controller: staff,
            decoration: InputDecoration(
              labelText: "Whom to meet",
              contentPadding: EdgeInsets.all(8),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ), */
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: RaisedButton(
                elevation: 0.0,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text('Add Vistors',
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
                onPressed: isUploading ? null : () => handleSubmit()
                // _onRegister(widget.user.phoneNumber);
                ),
          )
        ],
      ),
    );
  }

  Container linearProgress() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.purple),
      ),
    );
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return file == null ? buildSplashScreen() : buildUploadForm();
  }
}

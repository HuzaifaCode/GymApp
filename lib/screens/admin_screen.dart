import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstapp/components/button.dart';
import 'package:firstapp/components/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/AuthServices.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _descriptioncontroller = TextEditingController();
  String imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Text(
          'Admin Panel',
          textAlign: TextAlign.center,
        )),
      ),
      backgroundColor: const Color(0xffE8EBF5),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFieldWidget(
                controller: _titlecontroller,
                prefixIcon: Icons.title,
                hintText: "Enter title",
                labelText: "Title"),
            const SizedBox(
              height: 30,
            ),
            TextFieldWidget(
                controller: _descriptioncontroller,
                prefixIcon: Icons.description,
                hintText: "Enter Description",
                labelText: "Description"),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              backgroundColor: Colors.black,
              buttonTitle: Text("Open Camera"),
              onPressed: () async {
                ImagePicker imagePicker = ImagePicker();
                XFile? file =
                    await imagePicker.pickImage(source: ImageSource.camera);
                if (file == null) return;
                String uniqueFileName =
                    DateTime.now().microsecondsSinceEpoch.toString();
                //step 2
                Reference referenceRoot = FirebaseStorage.instance.ref();
                Reference referenceImageDirectory =
                    referenceRoot.child('images');

                Reference imageToUpload =
                    referenceImageDirectory.child(uniqueFileName);

                try {
                  await imageToUpload.putFile(File(file!.path));
                  imageUrl = await imageToUpload.getDownloadURL();
                  print(imageUrl);
                  //AuthServices().uploadImage(imageUrl: imageUrl);
                  AuthServices().uploadImage(
                      imageUrl: imageUrl,
                      title: _titlecontroller.text.toString(),
                      description: _descriptioncontroller.text.toString(),
                      context: context);
                } catch (e) {}
              },
            ),
          ],
        ),
      ),
    ));
  }
}

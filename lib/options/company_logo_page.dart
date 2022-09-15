import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invoice_generator/globels.dart';
import 'package:image_picker/image_picker.dart';

class Company_Logo extends StatefulWidget {
  const Company_Logo({Key? key}) : super(key: key);

  @override
  State<Company_Logo> createState() => _Company_LogoState();
}

class _Company_LogoState extends State<Company_Logo> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Company Logo"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: _height * 0.3,
            width: _width,
            color: Colors.white,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundImage:
                      (Globel.image != null) ? FileImage(Globel.image!) : null,
                  backgroundColor: Colors.grey,
                  radius: 60,
                  child: Text(
                    (Globel.image != null) ? "" : "ADD",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    XFile? pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      Globel.image = File(pickedFile!.path);
                      // Navigator.of(context).pop();
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  Globel.image = File("assets/images/person.png");
                });
              },
              child: const Text("CLEAR")),
        ],
      ),
    );
  }
}

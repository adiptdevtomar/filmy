import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:filmy/views/hive/hive_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../helper.dart';

class EditMovie extends StatefulWidget {
  const EditMovie({Key? key}) : super(key: key);

  @override
  State<EditMovie> createState() => _EditMovieState();
}

class _EditMovieState extends State<EditMovie> {
  Uint8List? image;
  String? name;
  String? directorName;
  String? description;
  ImagePicker imagePicker = ImagePicker();

  _saveMovie() {
    Box<Movies> contactsBox = Hive.box(Names.hiveBox);
    contactsBox.add(Movies(name!, directorName!, description!, image!));
    Navigator.pop(context);
  }

  Future<void> _pickImage() async {
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      print(pickedImage.name);
      final byteImage = image = await pickedImage.readAsBytes();
      setState(() {
        image = byteImage;
      });
    }
  }

  bool _isEnabled() {
    if (image != null &&
        (name != null && name!.isNotEmpty) &&
        (directorName != null && directorName!.isNotEmpty) &&
        (description != null && description!.isNotEmpty)) {
      return true;
    }
    return false;
  }

  Widget _buildHeaderText({required String title}) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.0,
        top: 30.0,
        bottom: 8.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: headingStyle,
        ),
      ),
    );
  }

  Widget _buildSelectImageButton() {
    return TextButton(
      onPressed: () {
        _pickImage();
      },
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
      ),
      child: (image != null)
          ? Container(
              height: 120.0,
              width: 120.0,
              child: Image.memory(
                image!,
                fit: BoxFit.cover,
              ),
            )
          : Container(
              padding: EdgeInsets.all(6.0),
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white.withOpacity(0.1),
              ),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(8),
                strokeWidth: 2.0,
                color: Colors.grey,
                dashPattern: [6, 6],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Select image',
                        style: TextStyle(
                          fontSize: 12.0,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSelectImageButton(),
              _buildHeaderText(title: 'Movie Name'),
              TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                maxLines: 1,
                decoration: textFieldDecoration,
              ),
              _buildHeaderText(title: 'Director Name'),
              TextField(
                onChanged: (value) {
                  setState(() {
                    directorName = value;
                  });
                },
                maxLines: 1,
                decoration: textFieldDecoration,
              ),
              _buildHeaderText(title: 'About Movie'),
              TextField(
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                maxLines: 10,
                decoration: textFieldDecoration.copyWith(
                  contentPadding: EdgeInsets.only(
                    top: 25.0,
                    left: 15.0,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              SizedBox(
                width: 100.0,
                height: 40.0,
                child: Opacity(
                  opacity: (_isEnabled()) ? 1.0 : 0.5,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xfffcb402),
                    ),
                    onPressed: (_isEnabled())
                        ? () {
                            _saveMovie();
                          }
                        : null,
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

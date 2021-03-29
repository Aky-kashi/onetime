import 'dart:io';

import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:onetime/data_model/user.dart';
import 'package:onetime/models/db/database_manager.dart';
import 'package:onetime/utils/constans.dart';

class PostRepository {
  final DatabaseManager dbManager;

  PostRepository({this.dbManager});

  Future<void> post(User currentUser, String caption) async{
    //TODO

  }

  Future<File> pickedImage(uploadType) async{
    final imagePicker = ImagePicker();

    if(uploadType == UploadType.GALLERY) {
      final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
      return File(pickedImage.path);
    } else {
      final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
      return File(pickedImage.path);
    }

  }
}

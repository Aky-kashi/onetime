import "package:flutter/material.dart";
import 'package:onetime/data_model/user.dart';
import 'package:onetime/models/db/database_manager.dart';

class PostRepository {
  final DatabaseManager dbManager;

  PostRepository({this.dbManager});

  Future<void> post(User currentUser, String caption) async{
    //TODO

  }
}

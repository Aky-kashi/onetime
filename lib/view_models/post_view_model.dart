import"package:flutter/material.dart";
import 'package:onetime/repositories/post_repository.dart';
import 'package:onetime/repositories/user_repository.dart';

class PostViewModel extends ChangeNotifier{
  final UserRepository userRepository;
  final PostRepository postRepository;
  PostViewModel({this.userRepository, this.postRepository});

  bool isProcessing = false;
  String caption = "";


}
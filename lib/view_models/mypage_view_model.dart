import"package:flutter/material.dart";
import 'package:onetime/data_model/user.dart';
import 'package:onetime/repositories/post_repository.dart';
import 'package:onetime/repositories/user_repository.dart';
import 'package:onetime/utils/constans.dart';

class MyPageViewModel extends ChangeNotifier{
  final UserRepository userRepository;
  final PostRepository postRepository;
  MyPageViewModel({this.userRepository, this.postRepository});

  User myPageUser;
  User get currentUser =>UserRepository.currentUser;



  void setMyUser(ProfileMode profileMode) {
   /* if (profileMode == profileMode.MYSELF){
      myPageUser = currentUser;
 */
    }
  }




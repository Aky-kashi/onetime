import "package:flutter/material.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverPod;
import 'package:onetime/data_model/user.dart';
import 'package:onetime/utils/constans.dart';
import 'package:onetime/view_models/mypage_view_model.dart';
import 'package:provider/provider.dart';




class MyPage extends StatelessWidget {
  final ProfileMode profileMode;
  final User selectedUser;
  MyPage({this.profileMode, this.selectedUser});

  @override
  Widget build(BuildContext context) {
    final mypageViewModel = Provider.of<MyPageViewModel>(context,listen:false);
    mypageViewModel.setMyUser(profileMode);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Text("MyPage Screen"),
      ),
    );
  }
}

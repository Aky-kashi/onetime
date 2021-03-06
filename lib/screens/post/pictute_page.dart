import"package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onetime/repositories/post_repository.dart';
import 'package:onetime/utils/constans.dart';
import 'package:onetime/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

class PicturePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);
    return SizedBox(
        child: Row(
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                postViewModel.pickImage(UploadType.GALLERY);
              },
              backgroundColor: Colors.blue[200],
              icon: Icon(Icons.image),
              label: const Text('写真'),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                postViewModel.pickImage(UploadType.CAMERA);
              },
              backgroundColor: Colors.blue[200],
              icon: Icon(Icons.camera),
              label: const Text('カメラ'),
            )
          ],
        ));


  }
}

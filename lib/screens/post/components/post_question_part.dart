import 'dart:io';

import "package:flutter/material.dart";
import 'package:onetime/components/hero.image.dart';
import 'package:onetime/screens/enlarge_image_screen.dart';
import 'package:onetime/utils/constans.dart';
import 'package:onetime/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

class PostQuestionPart extends StatelessWidget {
  final PostCaptionOpenMode from;

  PostQuestionPart({@required this.from});

  @override
  Widget build(BuildContext context) {
    if (from == PostCaptionOpenMode.FROM_POST) {

      final postViewModel = Provider.of<PostViewModel>(context);
      final image = Image.file(postViewModel.imageFile);

      return ListTile(
          leading:HeroImage(
          image: Image.file(postViewModel.imageFile),
          onTap: () => _displayLargeImage(context, image),

        ));
        //title: PostQuestionPart(),
    } else {
      return Container();
    }
  }

  _displayLargeImage(BuildContext context, image) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => EnlargeImageScreen(image: image)));
  }
}

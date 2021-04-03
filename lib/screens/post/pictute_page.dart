import"package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onetime/repositories/post_repository.dart';

class PicturePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
          children: [
            FloatingActionButton.extended(
              onPressed: null,
              backgroundColor: Colors.blue[200],
              icon: Icon(Icons.image),
              label: const Text('写真'),
            ),
            FloatingActionButton.extended(
              onPressed: null,
              backgroundColor: Colors.blue[200],
              icon: Icon(Icons.camera),
              label: const Text('カメラ'),
            )
          ],
        ));


  }
}

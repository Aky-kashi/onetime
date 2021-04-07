import"package:flutter/material.dart";
import 'package:onetime/components/hero.image.dart';

class EnlargeImageScreen extends StatelessWidget {
  final Image image;
  EnlargeImageScreen({this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: HeroImage(
          image:image,
          onTap:(){
            Navigator.pop(context);
          }

        )
      )
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildClassIntroPage extends StatefulWidget {
  BuildClassIntroPage({Key key}) : super(key: key);

  @override
  _BuildClassIntroPageState createState() => _BuildClassIntroPageState();
}

class _BuildClassIntroPageState extends State<BuildClassIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body:Container(child: Text('授業詳細'),)
      );
  }
}
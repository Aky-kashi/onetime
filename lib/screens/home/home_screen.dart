import "package:flutter/material.dart";
import 'package:onetime/screens/mypage/buildClassIntroPage.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: ListView.builder(
          shrinkWrap: true, // 高さ関連のエラーが出たら、使う
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return _buildClassTile(index + 1, 'introduction', context);
          },
        ),
      ),
    );
  }

  Widget _buildClassTile(
    int index,
    String introduction,
    context,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.class_,
          size: 40,
        ),
        title: Text(
          '授業' + index.toString(),
        ),
        subtitle: Text(introduction + index.toString()),
        trailing: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuildClassIntroPage(),
              ),
            );
            //Navigator.of(context).pushNamed('/chatpage');
          },
          child: Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}

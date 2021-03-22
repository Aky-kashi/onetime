import "package:flutter/material.dart";
import 'package:onetime/screens/login/login_screen.dart';
import 'package:onetime/screens/mypage/buildClassIntroPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text = '';

  void chatbox(String input) {
    text = input;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                // header
                UserAccountsDrawerHeader(
                  //icon图标，当每上传照片时为登陆图标，上传照片后显示图片
                  currentAccountPicture: GestureDetector(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => LoginPage(),
                    //     ),
                    //   );
                    //   //Navigator.of(context).pushNamed('/chatpage');
                    // },
                    child: Row(
                      children: [
                        InkWell(
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => LoginPage(),
                          //     ),
                          //   );
                          // },
                          child: Icon(
                            Icons.account_circle,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  accountEmail: Text('@Onetime.com'),

                  //背景
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                  ),
                ),

                // make an account
                ListTile(
                    // title: GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => LoginPage(),
                    //       ),
                    //     );
                    //     //Navigator.of(context).pushNamed('/chatpage');
                    //   },
                    //   child: Text('Make an account'),
                    // ),
                    // leading: GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => LoginPage(),
                    //       ),
                    //     );
                    //     //Navigator.of(context).pushNamed('/chatpage');
                    //   },
                    //   child: Icon(
                    //     Icons.account_circle,
                    //     color: Colors.black,
                    //     size: 30,
                    //   ),
                    // ),
                    ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
          icon:Icon(Icons.login),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );}
          )],
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '教師を探す',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          Form(
            // key: formKey,
            child: SizedBox(
              height: 90,
              width: 400,
              child: ColoredBox(
                color: Colors.white,
                child: TextFormField(
                  maxLines: 2,
                  onChanged: (String text) {
                    chatbox(text);
                  },
                  decoration: InputDecoration(
                    hintText: '言語名、教師名などを入力してください',  
                    contentPadding: const EdgeInsets.all(10),
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true, // 高さ関連のエラーが出たら、使う
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return _buildClassTile(index + 1, 'introduction', context);
              },
            ),
          ),
        ],
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

import "package:flutter/material.dart";
import 'package:onetime/screens/login/login_screen.dart';
import 'package:onetime/screens/mypage/buildClassIntroPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  String text = '';

  void chatbox(String input) {
    text = input;
    setState(() {});
  }

  final List<Tab> tabs = <Tab>[
    Tab(text: 'おすすめ'),
    Tab(text: '急上昇'),
    Tab(text: '最近チェック'),
    Tab(text: 'お気に入り'),
  ];

  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
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
        //up tab
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),

        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.login),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              })
        ],
        backgroundColor: Colors.lightBlue,
      ),
      body: TabBarView(
        controller: _tabController,
        children:tabs.map((Tab tab) {
          return createTab(tab);
        }).toList(),
      ),
    );
  }
      
  

Widget createTab(Tab tab) {
    return Center(
        child: Text(
          tab.text + 'page',
          style: const TextStyle(
            fontSize: 32.0,
            color: Colors.blue,
          ),
        )
    );
  }
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


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

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: drawerKey,
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
              },
            )
          ],
          backgroundColor: Colors.lightBlue,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            createTabRecommed(),
            createTabHot(),
            createTabChecked(),
            createTabGood(),
          ],
        ),
      ),
    );
  }

  Widget createTabRecommed() {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 20.0,
          top: 50.0,
          width: 180.0,
          height: 200.0,
          child: Container(
            child: ListTile(
              leading: ClipRRect(
                child: Image.asset(
                  'assets/images/autumnicon.jpg',
                  height: 20,
                  width: 20,
                ),
              ),
              title: Text('講師１'),
              subtitle: Text('flutter入門編'),
              onTap: () {/* react to the tile being tapped */},
            ),
            color: Colors.indigo,
          ),
        ),
        Positioned(
          top: 50.0,
          right: 20.0,
          width: 180.0,
          height: 200.0,
          child: Container(
            color: Colors.cyan,
          ),
        ),
        Positioned(
          bottom: 160.0,
          left: 20.0,
          width: 180.0,
          height: 200.0,
          child: Container(
            color: Colors.yellowAccent,
          ),
        ),
        Positioned(
          bottom: 160.0,
          right: 20.0,
          width: 180.0,
          height: 200.0,
          child: Container(
            color: Colors.lightGreen,
          ),
        ),
      ],
    );
  }
}

Widget createTabHot() {
  return Container(
    child: Text('hot'),
  );
}

Widget createTabChecked() {
  return Container(
    child: Text('checked'),
  );
}

Widget createTabGood() {
  return Container(
    child: Text('good'),
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

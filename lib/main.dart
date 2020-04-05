import 'package:flutter/material.dart';
import 'demo/listview_demo.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/drawer_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70),
    );
  }
}

class Home extends StatelessWidget {
  // const Home({Key key}) : super(key: key);

  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text('this is my app'),
            //标签栏
            bottom: TabBar(
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              //标签元素
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.local_florist),
                ),
                Tab(
                  icon: Icon(Icons.change_history),
                ),
                Tab(
                  icon: Icon(Icons.directions_bike),
                )
              ],
            ),
            //
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () {
                  print('Search button is pressed');
                },
              )
            ],
            elevation: 0.0,
          ),
          body: TabBarView(children: <Widget>[
            ListViewDemo(),
            Icon(Icons.change_history, size: 128),
            Icon(Icons.directions_bike, size: 128),
          ]),
          //侧边栏
          drawer: DrawerDemo(),
          //底部导航栏
          bottomNavigationBar: BottomNavigationBarDemo(),
        ));
  }
}

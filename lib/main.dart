import 'package:flutter/material.dart';
import 'package:my_app/demo/animation/animation_demo.dart';
import 'package:my_app/demo/bloc/bloc_demo.dart';
import 'package:my_app/demo/http/http_demo.dart';
import 'package:my_app/demo/rxdart/rxdart_demo.dart';
import 'package:my_app/demo/stream/stream_demo.dart';
import 'demo/layout_demo.dart';
import 'demo/listview_demo.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/drawer_demo.dart';
import 'demo/basic_demo.dart';
import 'demo/view_demo.dart';
import 'demo/sliver_demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/form_demo.dart';
import 'demo/material_components.dart';
import 'demo/state/state_management_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: NavigatorDemo(),

      //初始路由
      initialRoute: '/animation',

      routes: {
        '/': (context) => Home(),
        '/about': (context) => Page(
              title: 'Hello About',
            ),
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialComponents(),
        '/state-management': (context) => StateManagementDemo(),
        '/stream': (context) => StreamDemo(),
        '/rxdart': (context) => RxDartDemo(),
        '/bloc': (context) => BlocDemo(),
        '/http': (context) => HttpDemo(),
        '/animation':(context) => AnimationDemo()
      },
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70,
          accentColor: Color.fromRGBO(3, 54, 255, 1)),
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
        length: 4,
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
                ),
                Tab(
                  icon: Icon(Icons.view_quilt),
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
            // Icon(Icons.change_history, size: 128),
            BasicDemo(),
            LayoutDemo(),
            SliverDemo()
          ]),
          //侧边栏
          drawer: DrawerDemo(),
          //底部导航栏
          bottomNavigationBar: BottomNavigationBarDemo(),
        ));
  }
}

import 'package:flutter/material.dart';

//弹出式菜单
class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  // int _currentMenuItemIndex = 0;
  String _currentMenuValue = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButtonDemo'),
        elevation: 0.0,
        //一般情况下放在appBar的actions中
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Text(_currentMenuItemIndex.toString()),
                Text(_currentMenuValue),
                //包裹弹出菜单项
                PopupMenuButton(
                  //选中事件
                  onSelected: (v) {
                    print(v);
                    setState(() {
                      // this._currentMenuItemIndex = v;
                      this._currentMenuValue = v;
                    });
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      child: Text('Home'),
                      value: 'Home',
                    ),
                    PopupMenuItem(
                      child: Text('Discover'),
                      value: 'Discover',
                    ),
                    PopupMenuItem(
                      child: Text('Community'),
                      value: 'Community',
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

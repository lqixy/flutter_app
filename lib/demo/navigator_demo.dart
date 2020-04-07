import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            FlatButton(
              child: Text('Home'),
              onPressed: null,
            ),
            FlatButton(
              child: Text('About'),
              onPressed: () {
                // //路由;
                // //MaterialPageRoute方法跳转页面
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => Page(
                //           title: 'Hello About',
                //         )));

                //用名称路由
                Navigator.pushNamed(context, '/about');
              },
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String title;

  Page({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),

      //页面后退按钮
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)),
    );
  }
}

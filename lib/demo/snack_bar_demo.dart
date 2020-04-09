import 'package:flutter/material.dart';

//短暂显示在底部
class SnackBarDemo extends StatefulWidget {
  @override
  //短暂显示在底部
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

//短暂显示在底部
class _SnackBarDemoState extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //短暂显示在底部
        title: Text('SnackBarDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[SnackBarButton()],
            )
          ],
        ),
      ),
    );
  }
}

class SnackBarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Open SnackBar'),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Processing...'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ));
      },
    );
  }
}

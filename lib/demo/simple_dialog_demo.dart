import 'package:flutter/material.dart';

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = 'Nothing';
  //打开对话框
  Future _openSimpleDialog() async {
    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: <Widget>[
              //对话框选项
              SimpleDialogOption(
                child: Text('Cancel'),
                onPressed: () {
                  //
                  Navigator.pop(context, Option.Cancel);
                },
              ),
              SimpleDialogOption(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context, Option.OK);
                  })
            ],
          );
        });

    switch (option) {
      case Option.OK:
        setState(() {
          this._choice = 'OK';
        });
        break;
      default:
        setState(() {
          this._choice = 'Cancel';
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text('Your choice is: $_choice')],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _openSimpleDialog,
      ),
    );
  }
}

enum Option { OK, Cancel }

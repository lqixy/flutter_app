import 'package:flutter/material.dart';

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  //获取用户 动作
  String _choice = 'Nothing';

  Future _openAlertDialog() async {
    final action = await showDialog(
        context: context,
        //强制选择;点击空白处不关闭
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog'),
            content: Text('Are you sure about this?'),
            //对话框中动作组件
            actions: <Widget>[
              //水平按钮
              FlatButton(
                  onPressed: () {
                    //第二个参数表示当前showDialog返回的值
                    Navigator.pop(context, Action.Cancel);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.blue),
                  )),
              FlatButton(
                  onPressed: () {
                    //第二个参数表示当前showDialog返回的值
                    Navigator.pop(context, Action.OK);
                  },
                  child: Text('OK', style: TextStyle(color: Colors.blue)))
            ],
          );
        });

    switch (action) {
      case Action.OK:
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
          title: Text('AlertDialogDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Your choice is: $_choice'),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Open AlertDialog'),
                    onPressed: _openAlertDialog,
                  )
                ],
              )
            ],
          ),
        ));
  }
}

enum Action { OK, Cancel }

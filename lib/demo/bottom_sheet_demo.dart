import 'package:flutter/material.dart';

//从屏幕底部划动显示
class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  //询问弹出组件
  _openBottomSheet() {

    //此种方法错误
    // showBottomSheet(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return BottomAppBar(
    //         child: Container(
    //           height: 90,
    //           width: double.infinity,
    //           padding: EdgeInsets.all(16),
    //           child: Row(
    //             children: <Widget>[
    //               Icon(Icons.pause_circle_outline),
    //               SizedBox(
    //                 width: 16,
    //               ),
    //               Text('01:30 / 03:30'),
    //               Expanded(
    //                 child: Text(
    //                   'Fix you - Coldplay',
    //                   textAlign: TextAlign.right,
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       );
    //     });
    _bottomSheetScaffoldKey.currentState
        .showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(
                width: 16,
              ),
              Text('01:30 / 03:30'),
              Expanded(
                child: Text(
                  'Fix you - Coldplay',
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  //底部弹出对话框
  Future _openModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Option A'),
                  onTap: () {
                    Navigator.pop(context, 'A');
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: () {
                    Navigator.pop(context, 'B');
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: () {
                    Navigator.pop(context, 'C');
                  },
                ),
              ],
            ),
          );
        });
    print(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _bottomSheetScaffoldKey,
        appBar: AppBar(
          title: Text('BottomSheetDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text('Open BottomSheet'),
                    onPressed: _openBottomSheet,
                  ),
                  FlatButton(
                    child: Text('Modal BottomSheet'),
                    onPressed: _openModalBottomSheet,
                  )
                ],
              )
            ],
          ),
        ));
  }
}

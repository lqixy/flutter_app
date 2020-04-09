import 'package:flutter/material.dart';

//面板类
class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({this.headerText, this.body, this.isExpanded = false});
}

//收缩面板
class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  // bool _isExpanded = false;
  //面板集合
  List<ExpansionPanelItem> _expansionPanelItems;

  //初始化面板集合
  @override
  void initState() {
    super.initState();
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
          headerText: 'Panel A',
          body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Text('Content for Panel A.'),
          )),
      ExpansionPanelItem(
          headerText: 'Panel B',
          body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Text('Content for PanelB.'),
          )),
      ExpansionPanelItem(
          headerText: 'Panel C',
          body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Text('Content for Panel C.'),
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              //收缩回调,
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  // this._isExpanded = !isExpanded;
                  _expansionPanelItems[panelIndex].isExpanded = !isExpanded;
                  
                });
              },
              children: _expansionPanelItems.map((x) {
                return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: Text(x.headerText),
                      );
                    },
                    body: x.body,
                    isExpanded: x.isExpanded);
              }).toList(),
              // children: [
              //   ExpansionPanel(
              //     headerBuilder: (BuildContext context, bool isExpanded) {
              //       return Container(
              //         padding: EdgeInsets.all(16),
              //         child: Text(
              //           'Panel A',
              //           style: Theme.of(context).textTheme.title,
              //         ),
              //       );
              //     },
              //     body: Container(
              //       padding: EdgeInsets.all(16),
              //       width: double.infinity,
              //       child: Text('Content for Panel A.'),
              //     ),
              //     //收缩状态,默认为收起
              //     isExpanded: _isExpanded,
              //   )
              // ],
            )
          ],
        ),
      ),
    );
  }
}

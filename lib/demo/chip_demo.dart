import 'package:flutter/material.dart';

//碎片组件
class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _chips = ['Phone', 'laptop', 'PC', 'MAC'];
  String _action = 'Nothing';
  List<String> _selected = [];
  String _choice = 'PC';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //包装组件,宽度超出会自动另起一行
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.center,
              //包装组件中部件列的间距
              spacing: 8.0,
              //包装组件中部件行的间距
              runSpacing: 8.0,

              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Wanghae'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('刘'),
                  ),
                ),
                Chip(
                  label: Text('Wanghae'),
                  avatar: CircleAvatar(
                    // backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        'https://www.itying.com/images/flutter/1.png'),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  //删除
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove this tag',
                ),
                //分隔符
                Divider(
                  color: Colors.grey,
                  height: 32,
                  //缩进距
                  // indent: 32,
                )
              ],
            ),
            Divider(
              height: 32,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _chips.map((x) {
                return Chip(
                  label: Text(x),
                  onDeleted: () {
                    setState(() {
                      this._chips.remove(x);
                    });
                  },
                );
              }).toList(),
            ),
            Divider(
              height: 32,
            ),
            Container(
              width: double.infinity,
              child: Text('ActionChip: $_action'),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _chips.map((x) {
                //带动作的碎片
                return ActionChip(
                  label: Text(x),
                  onPressed: () {
                    setState(() {
                      this._action = x;
                    });
                  },
                  tooltip: 'This is $x',
                );
              }).toList(),
            ),
            Divider(
              height: 32,
            ),
            Container(
              width: double.infinity,
              child: Text('FilterChip: ${_selected.toString()}'),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _chips.map((x) {
                //带选择的碎片多选
                return FilterChip(
                  label: Text(x),
                  selected: _selected.contains(x),
                  onSelected: (v) {
                    setState(() {
                      if (!this._selected.contains(x)) {
                        this._selected.add(x);
                      } else {
                        this._selected.remove(x);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            Divider(
              height: 32,
            ),
            Container(
              width: double.infinity,
              child: Text('ChoiceChip: $_choice'),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _chips.map((x) {
                //单选带选择的碎片
                return ChoiceChip(
                  label: Text(x),
                  selectedColor: Colors.grey,
                  selected: this._choice == x,
                  onSelected: (v) {
                    setState(() {
                      this._choice = x;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),

      //浮动按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          //重新加载集合
          setState(() {
            this._chips = ['Phone', 'laptop', 'PC', 'MAC'];
            this._selected = [];
            this._choice = 'PC';
          });
        },
      ),
    );
  }
}

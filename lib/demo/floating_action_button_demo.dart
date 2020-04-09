import 'package:flutter/material.dart';

//浮动按钮
class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //自定义浮动按钮
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      elevation: 0,
      backgroundColor: Colors.black87,
      // //形状
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );

    //自定义浮动按钮扩展
    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
        backgroundColor: Colors.black87,
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text('add'));

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      //浮动按钮位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
        ),
        //浮动按钮重叠，使用CircularNotchedRectangle切割出部分
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

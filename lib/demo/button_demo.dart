import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //水平按钮
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //不带图标
        FlatButton(
          child: Text('Button'),
          onPressed: () {},
          //溅墨颜色
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        //带图标
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          //溅墨颜色
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );
    //凸起按钮
    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                  // shape: BeveledRectangleBorder(
                  //   borderRadius: BorderRadius.circular(5),
                  // )
                  //足球场形状
                  shape: StadiumBorder())),
          child: RaisedButton(
            child: Text('Button'),
            onPressed: () {},
            //溅墨颜色
            splashColor: Colors.grey,
            //背景色
            // color: Theme.of(context).accentColor,
            elevation: 0,
            // textColor: Colors.white,
            // textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          //溅墨颜色
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        )
      ],
    );
    //描边按钮
    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          onPressed: () {},
          child: Text('Button'),
          splashColor: Colors.grey[100],
          //描边颜色
          borderSide: BorderSide(color: Colors.black),
          textColor: Colors.black,
          highlightedBorderColor: Colors.grey,
        ),
        SizedBox(width: 16),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          onPressed: () {},
          label: Text('Button'),
          splashColor: Colors.grey,
        )
      ],
    );
    //描边按钮
    final Widget fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          onPressed: () {},
          child: Text('Button'),
          splashColor: Colors.grey[100],
          borderSide: BorderSide(color: Colors.black),
          textColor: Colors.black,
          highlightedBorderColor: Colors.grey,
        ),
        SizedBox(width: 18),
        OutlineButton(
          onPressed: () {},
          child: Text('Button'),
          splashColor: Colors.grey[100],
          borderSide: BorderSide(color: Colors.black),
          textColor: Colors.black,
          highlightedBorderColor: Colors.grey,
        ),
      ],
    );
    //自定义长度描边按钮
    final Widget expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 130,
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(width: 18),
        Container(
          width: 180,
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        )
      ],
    );
    //按钮组
    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                  padding: EdgeInsets.symmetric(horizontal: 44))),
          child: //并排显示的按钮组,中间有间距
              ButtonBar(
            children: <Widget>[
              OutlineButton(
                onPressed: () {},
                child: Text('Button'),
                splashColor: Colors.grey[100],
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
              OutlineButton(
                onPressed: () {},
                child: Text('Button'),
                splashColor: Colors.grey[100],
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
              // RaisedButton(
              //   child: Text('Button'),
              //   onPressed: () {},
              // ),
              // FlatButton(onPressed: () {}, child: Text('Button'))
            ],
          ),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flatButtonDemo,
            raisedButtonDemo,
            outlineButtonDemo,
            fixedWidthButton,
            expandedButton,
            buttonBarDemo
          ],
        ),
      ),
    );
  }
}

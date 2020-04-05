import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: ColumnDemo());
  }
}

//横排列
class RowDemo extends StatelessWidget {
  const RowDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //主轴为横
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      //交叉轴
      crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
        IconBadge(Icons.pool),
        IconBadge(Icons.beach_access),
        IconBadge(Icons.airplanemode_active),
      ],
    );
  }
}

//竖排列
class ColumnDemo extends StatelessWidget {
  const ColumnDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //主轴为竖
      mainAxisAlignment: MainAxisAlignment.center,

      // //交叉轴
      // crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
       
       //限制该组件内部的最大宽高
       ConstrainedBox(
         constraints: BoxConstraints(maxHeight: 200,
         maxWidth: 200),
         child: Container(color: Colors.blue,),)
      //  AspectRatio(
      //    //该窗口的宽高比
      //    aspectRatio: 3.0/2.0,
      //    child: Container(
      //    color:Color.fromRGBO(3, 54, 255, 1),
      //  ),)
        
      ],
    );
  }
}
 //小部件
class StackDemo extends StatelessWidget {
  const StackDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
          //盒子
        SizedBox(
          width: 200,
          height: 100,
          child: Container(
            //矩形中的某一个点,
            //可设置该组件中的元素位移
            alignment: Alignment(1.0,0.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
        //设置间隔
        SizedBox(height: 32,),
        SizedBox(
          width: 100,
          height: 100,
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                // borderRadius: BorderRadius.circular(8)
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  Color.fromRGBO(7, 102, 255, 1),
                  Color.fromRGBO(3, 54, 255, 1)
                ])
                ),
            child: Icon(
              Icons.brightness_2,
              color: Colors.white,
              size: 32,
            ),
          ),
        )
        // IconBadge(Icons.pool),
        //     IconBadge(Icons.beach_access),
        //     IconBadge(Icons.airplanemode_active),
        ],);
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Icon(icon, size: size, color: Colors.white),
        width: size + 60,
        height: size + 60,
        color: Color.fromRGBO(3, 54, 255, 1.0));
  }
}

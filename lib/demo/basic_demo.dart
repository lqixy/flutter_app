import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  // const BasicDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerDemo();
  }
}

//可设置边距,背景,等效果
class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[100],

      //背景图像
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('https://www.itying.com/images/flutter/3.png'),

            //控制位置
            alignment: Alignment.topCenter,

            // //设置重复模式
            // repeat: ImageRepeat.repeatY

            //填充模式
            fit: BoxFit.cover,

            //设置颜色滤镜
            colorFilter: ColorFilter.mode(
                //withOpacity 不透明度
                Colors.indigoAccent[400].withOpacity(0.5),
                //混合模式
                BlendMode.hardLight)),
      ),

      child: Row(
        //主轴边距
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.pool,
              size: 32,
              color: Colors.white,
            ),
            // color: Color.fromRGBO(3, 54, 255, 1.0),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),

              //边框圆角
              // borderRadius: BorderRadius.circular(16),
              //改变盒子形状 与borderRadius互斥
              shape: BoxShape.circle,

              // //渐变(镜像渐变)由外向内变化
              // gradient: RadialGradient(colors: [
              //   Color.fromRGBO(7, 102, 255, 1.0),
              //   Color.fromRGBO(3, 28, 128, 1.0)
              // ]),

              //渐变(线性渐变)由左向右变化
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 28, 128, 1.0)
                ],

                //渐变开始位置
                begin: Alignment.topCenter,
                //渐变结束位置
                end: Alignment.bottomCenter,
              ),

              //阴影
              boxShadow: [
                BoxShadow(
                  //偏移
                  offset: Offset(0.0, 16.0),
                  color: Color.fromRGBO(16, 20, 188, 1),
                  //阴影模糊程度
                  blurRadius: 25.0,
                  //控制阴影面积:负数缩小
                  spreadRadius: -9,
                ),
              ],

              //边框统一设置
              border: Border.all(
                  color: Colors.indigoAccent[100],
                  width: 3,
                  style: BorderStyle.solid),

              // //边框:单独设置
              // border: Border(
              //     top: BorderSide(
              //         color: Colors.indigoAccent[100],
              //         width: 3,
              //         style: BorderStyle.solid),
              //     bottom: BorderSide(
              //         color: Colors.indigoAccent[100],
              //         width: 3,
              //         style: BorderStyle.solid))
            ),
          )
        ],
      ),
    );
  }
}

//富文本
class RichTextDemo extends StatelessWidget {
  const RichTextDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'hello',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 34,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100),
            children: [
          TextSpan(text: '.net', style: TextStyle(fontSize: 17))
        ]));
  }
}

//文本
class TextDemo extends StatelessWidget {
  // const TextDemo({Key key}) : super(key: key);
  final TextStyle _textStyle = TextStyle(fontSize: 16);
  @override
  Widget build(BuildContext context) {
    return Text(
      'hello world',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 3,
    );
  }
}

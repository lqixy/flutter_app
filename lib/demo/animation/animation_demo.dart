import 'package:flutter/material.dart';

//动画
class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
//混合TickerProviderStateMixin
    with
        TickerProviderStateMixin {
  AnimationController animationDemoController;
  Animation animation;
  //动画颜色
  Animation animationColor;
  //动画曲线
  CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.animationDemoController = AnimationController(
        // //动画时间初始值
        // value: 32.0,
        // //动画开始时间
        // lowerBound: 32.0,
        // //动画结束时间（默认：1）
        // upperBound: 100.0,
        //动画持续时间
        duration: Duration(milliseconds: 1000),
        //防止屏幕外的动画消耗不必要的资源
        //Tick会在每一帧作一个反应
        //一般手机一秒会有60帧
        //使用this必须继承TickerProviderStateMixin
        vsync: this);

    //动画曲线
    //一定要在范围和颜色之前
    this.curve = CurvedAnimation(
        parent: this.animationDemoController, curve: Curves.bounceOut);

    //动画中需要的范围的值可以用Tween
    animation = Tween(begin: 32.0, end: 100.0).animate(curve);
    //动画颜色
    animationColor =
        ColorTween(begin: Colors.red, end: Colors.red[900]).animate(curve);

    // //监听
    // this.animationDemoController.addListener(() {
    //   // //动画的值在controller的value属性
    //   // //输出value的次数取决于动画持续时间和设备每秒帧数
    //   // print('${this.animationDemoController.value}');

    //   setState(() {});
    // });

    //监听动画运行状态
    this.animationDemoController.addStatusListener((AnimationStatus status) {
      print(status);
    });
    // //开始播放动画
    // this.animationDemoController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimateHeart(
        animations: [
          animation,
          animationColor,
        ],
        controller: this.animationDemoController,
      ),
    );
  }
}


//可以自定义动画小部件
class AnimateHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  //执行父类监听
  AnimateHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      icon: Icon(Icons.favorite),
      //使用动画时间
      // iconSize: animationDemoController.value,
      iconSize: this.animations[0].value,
      //
      color: this.animations[1].value,
      onPressed: () {
        // //点击开始动画
        // this.animationDemoController.forward();

        switch (this.controller.status) {
          case AnimationStatus.completed:
            this.controller.reverse();
            break;
          default:
            this.controller.forward();
        }
      },
    );
  }
}

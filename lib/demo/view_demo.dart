import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  const ViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

//builder动态创建
class GridViewBuilderDemo extends StatelessWidget {
  const GridViewBuilderDemo({Key key}) : super(key: key);

  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150,
      crossAxisSpacing:8,
      mainAxisSpacing:8),
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3, 
      //     crossAxisSpacing: 8, 
      //     mainAxisSpacing: 8),
      itemBuilder: _gridItemBuilder,
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
    );
  }
}

//Extent
class GridViewExtentDemo extends StatelessWidget {
  const GridViewExtentDemo({Key key}) : super(key: key);

  //方法
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0, 0),
        child: Text(
          'Item$index',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      //网格项目在交叉轴上最大尺寸
      maxCrossAxisExtent: 150,
      // //滚动方向
      // scrollDirection: Axis.horizontal,
      //设置网格边距
      crossAxisSpacing: 16,
      padding: EdgeInsets.all(16),
      mainAxisSpacing: 16,
      children: _buildTiles(100),
    );
  }
}

//网格视图
class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({Key key}) : super(key: key);

  //方法
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0, 0),
        child: Text(
          'Item$index',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      //可看作瓷砖
      crossAxisCount: 3,
      //滚动方向
      scrollDirection: Axis.horizontal,
      //设置网格边距
      crossAxisSpacing: 16,
      padding: EdgeInsets.all(16),
      mainAxisSpacing: 16,
      children: _buildTiles(100),
    );
  }
}

//
class PageViewBuilderDemo extends StatelessWidget {
  const PageViewBuilderDemo({Key key}) : super(key: key);

  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].author,
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView.builder(
      itemBuilder: _pageItemBuilder,
      itemCount: posts.length,
    ));
  }
}

//页面视图.
//无需导航按钮,在页面滑动切换
class PageViewDemo extends StatelessWidget {
  const PageViewDemo({Key key}) : super(key: key);

  // int _currentPageIndex=0;

  @override
  Widget build(BuildContext context) {
    return PageView(
      // //自动滑动
      // pageSnapping: false,

      // //反转
      // reverse: true,

      // //滑动方向
      // scrollDirection: Axis.horizontal,

      //页面控制器
      controller: PageController(
          //初始页面
          initialPage: 2,
          //记录页面
          keepPage: false,
          //页面可视比例
          viewportFraction: 0.85),

      //页面变化事件
      onPageChanged: (currentPage) => print('Page: $currentPage'),

      children: <Widget>[
        ContainerDemo(
          containerColor: Colors.brown[900],
          text: 'ONE',
          textColor: Colors.white,
        ),
        ContainerDemo(
          containerColor: Colors.grey[900],
          text: 'TWO',
          textColor: Colors.white,
        ),
        ContainerDemo(
          containerColor: Colors.blueGrey[900],
          text: 'THREE',
          textColor: Colors.white,
        )
      ],
    );
  }
}

class ContainerDemo extends StatelessWidget {
  ContainerDemo(
      {Key key, this.containerColor = Colors.brown, this.text, this.textColor})
      : super(key: key);

  Color containerColor;
  String text;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.containerColor,
      alignment: Alignment(0.0, 0.0),
      child: Text(
        this.text,
        style: TextStyle(fontSize: 32, color: this.textColor),
      ),
    );
  }
}

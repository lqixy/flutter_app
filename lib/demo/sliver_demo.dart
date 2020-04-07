import 'package:flutter/material.dart';
import '../model/post.dart';

//块 组件 Grid满足不了需求,可以用
class SliverDemo extends StatelessWidget {
  const SliverDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //顶部
          SliverAppBar(
            // title: Text('Hello'),
            // //一直展示
            // pinned: true,

            // //顶部栏无渐隐效果
            // floating: true,

            // //顶部栏的高度
            expandedHeight: 178,

            //顶部栏空间(可设置背景等)
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'this is world'.toUpperCase(),
                style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w400),
              ),
              background: Image.network(
                  'https://www.itying.com/images/flutter/1.png',
                  fit: BoxFit.cover),
            ),
          ),
          //让sliver显示在安全的区域
          SliverSafeArea(
              sliver: //可设置内部sliver间距
                  SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGridDemo(),
          )),
        ],
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.8),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        );
      }, childCount: posts.length),
    );
  }
}

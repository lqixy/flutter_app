import 'package:flutter/material.dart';
import '../model/post.dart';
import '../demo/post_show.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key key}) : super(key: key);

  Widget _listBuilder(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),

        //第二版,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                //设置图片比例
                AspectRatio(
                  //16比9
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    posts[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  posts[index].title,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  posts[index].author,
                  style: Theme.of(context).textTheme.subhead,
                ),
                SizedBox(
                  height: 16.0,
                )
              ],
            ),

            //
            Positioned.fill(
                child: Material(
                    color: Colors.transparent,

                    //InkWell区域溅墨效果
                    child: InkWell(
                        splashColor: Colors.white.withOpacity(0.3),
                        highlightColor: Colors.white.withOpacity(0.1),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  PostShow(post: posts[index])));
                        })))
          ],
        )

        // //第一版
        // child: Column(
        //   children: <Widget>[
        //     Image.network(posts[index].imageUrl),
        //     SizedBox(
        //       height: 16.0,
        //     ),
        //     Text(
        //       posts[index].title,
        //       style: Theme.of(context).textTheme.title,
        //     ),
        //     Text(
        //       posts[index].author,
        //       style: Theme.of(context).textTheme.subhead,
        //     ),
        //     SizedBox(
        //       height: 16.0,
        //     )
        //   ],
        // ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: _listBuilder, itemCount: posts.length);
  }
}

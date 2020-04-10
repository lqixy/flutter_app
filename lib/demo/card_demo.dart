import 'package:flutter/material.dart';
import 'package:my_app/model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: posts.map((x) {
              return Card(
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                        aspectRatio: 16 / 9,
                        //圆角效果
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4)),
                          child: Image.network(x.imageUrl, fit: BoxFit.cover),
                        )),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(x.imageUrl),
                      ),
                      title: Text(x.title),
                      subtitle: Text(x.author),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        x.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ButtonTheme.bar(
                        child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text('Like'.toUpperCase()),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text('Read'.toUpperCase()),
                          onPressed: () {},
                        )
                      ],
                    ))
                  ],
                ),
              );
            }).toList(),
          )),
    );
  }
}

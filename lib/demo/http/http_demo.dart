import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchPosts().then((v) => print(v));
  }

  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');

    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts =
          responseBody['posts'].map<Post>((x) => Post.fromJson(x)).toList();

      return posts;
    } else {
      throw Exception('');
    }
  }

  @override
  Widget build(BuildContext context) {
    //可动态返回小部件，多用于请求接口组装数据
    return FutureBuilder(
      future: fetchPosts(),
      //初始化时，snapshot是没有数据的。
      //connectionState 连接状态
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // print('data:${snapshot.data}');
        // print('connectionState:${snapshot.connectionState}');

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        }

        return ListView(
          children: snapshot.data.map<Widget>((item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(this.id, this.title, this.description, this.author, this.imageUrl);

  Post.fromJson(Map jsonStr)
      : id = jsonStr['id'],
        title = jsonStr['title'],
        description = jsonStr['description'],
        author = jsonStr['author'],
        imageUrl = jsonStr['imageUrl'];

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'author': author,
        'imageUrl': imageUrl
      };
}

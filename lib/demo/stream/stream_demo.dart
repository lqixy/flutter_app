import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  //接收流监听返回的值
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  String _data = '..';
  //不需要的流要关闭
  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo = StreamController<String>();
    _sinkDemo = _streamDemo.sink;
    print('Create a Stream');

    //监听流,在fetchData方法返回数据后操作
    print('Start listening on a stream.');
    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

    print('ini');
  }

  //监听流错误
  void onError(error) {
    print('$error');
  }

  //监听流完成
  void onDone() {
    print('done');
  }

  //该方法中的参数就是fetchData返回的数据
  void onData(String data) {
    setState(() {
      _data = data;
    });
    print('$data');
  }

  //
  Future<String> fetchData() async {
    //3秒后返回
    await Future.delayed(Duration(seconds: 5));
    return 'hello~';
    // throw 'Something happened';
  }

  //添加按钮方法
  void _addDataToStream() async {
    print('Add');

    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  //暂停按钮方法
  void _pauseStream() {
    print('Pause subscription');
    _streamDemoSubscription.pause();
  }

  //继续按钮方法
  void _resumeStream() {
    print('Resume subscription');
    _streamDemoSubscription.resume();
  }

  //取消按钮方法
  void _cancelStream() {
    print('Cancel subscription');
    _streamDemoSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text('$_data'),
            StreamBuilder(
              stream: _streamDemo.stream,
              //初始值
              initialData: '...',
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataToStream,
                ),
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

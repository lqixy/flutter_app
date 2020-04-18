import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

//响应式编程
class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textFieldSubject = PublishSubject<String>();
 
    _textFieldSubject
    
    // //过滤数据用where()
    // .where((x)=>x.length > 9)
    ////转换数据：map
    // .map((item) => 'item:$item')
    .listen((data) => print(data));

    // _textFieldSubject.close();
    //Observable<String> _observable = Observable(Stream.fromIterable(["hello","ni hao"]));
    // PublishSubject<String> _subject = PublishSubject<String>();
    ////监听
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();

    // //可以监听所有添加的数据（如果设置maxSize，则只监听设置的）
    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);
    // //添加数据
    // _subject.add('Hello');
    // _subject.add('Hola');
    // //监听
    // _subject.listen((data) => print('listen 1: $data'));
    // _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));
    // _subject.close();
  }

  //关闭subject
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    this._textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.black),
      child: TextField(
        onChanged: (v) {
          _textFieldSubject.add('input: $v');
        },
        onSubmitted: (v) {
          _textFieldSubject.add('submit: $v');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );
  }
}

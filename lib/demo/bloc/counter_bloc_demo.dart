import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (contex, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: () {
              // _counterBloc.log();
              //按下按钮，会使用counter这个skin往它的stream传递数据
              //CounterBloc构造方法中监听了这个stream，有数据就会
              //执行onData方法
              //onData中，会改变属性_count,
              //然后把_count交给_counterController
              //最后使用StreamBuilder构建小部件，
              //当数据变化里就会重新构建
              _counterBloc.counter.add(1);
            },
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // _counterBloc.log();
        _counterBloc.counter.add(1);
      },
    );
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  CounterProvider({this.child, this.bloc}) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: CounterProvider);

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;

  final _counterActionController = StreamController<int>();

  final _counterController = StreamController<int>();
  //get方法
  Stream<int> get count => _counterController.stream;
  //get方法
  StreamSink<int> get counter => _counterActionController.sink;

  //构造方法，监听controller输入的数据
  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(int d) {
    print('$d');
    _count += d;
    //把_count的值交给_counterController
    _counterController.add(_count);
  }

  void disponse() {
    _counterActionController.close();
    _counterController.close();
  }

  void log() {
    print('Bloc');
  }
}

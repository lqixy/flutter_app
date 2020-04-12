import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //返回ScopedModel部件
    return ScopedModel(
      //model就是自定义的类
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        body: CounterWrapper(),
        //要使用自定义model中的方法 使用ScopedModelDescendant
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          //不重建之中的部件
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount,
          ),
        ),
      ),
    );
  }
}

// class StateManagementDemo extends StatefulWidget {
//   @override
//   _StateManagementDemoState createState() => _StateManagementDemoState();
// }

// //使用scoped_model,有状态的插件,可以不用继承自StatefulWidget
// class _StateManagementDemoState extends State<StateManagementDemo> {
//   // int _count = 0;

//   // void _increaseCount() {
//   //   setState(() {
//   //     _count++;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
// return ScopedModel(
//   //必须有model,这样,其它小部件才能访问
//   model: CounterModel(),
//   child: Scaffold(
//     appBar: AppBar(title: Text('StateManagementDemo'),elevation: 0,),
// body: CounterProvider(),
//   ),
// );

//     // return CounterProvider(
//     //     _count,
//     //     _increaseCount,
//     //     Scaffold(
//     //       appBar: AppBar(
//     //         title: Text('StateManagementDemo'),
//     //         elevation: 0.0,
//     //       ),
//     //       // body: Counter(_count, _increaseCount),
//     //       body: CounterWrapper(),
//     //       // body: Center(
//     //       //   child: Chip(
//     //       //     label: Text('$count'),
//     //       //   ),
//     //       // ),
//     //       floatingActionButton: FloatingActionButton(
//     //         child: Icon(Icons.add),
//     //         onPressed: _increaseCount,
//     //       ),
//     //     ));
//     // // return Scaffold(
//     // //   appBar: AppBar(
//     // //     title: Text('StateManagementDemo'),
//     // //     elevation: 0.0,
//     // //   ),
//     // //   // body: Counter(_count, _increaseCount),
//     // //   body: CounterWrapper(_count, _increaseCount),
//     // //   // body: Center(
//     // //   //   child: Chip(
//     // //   //     label: Text('$count'),
//     // //   //   ),
//     // //   // ),
//     // //   floatingActionButton: FloatingActionButton(
//     // //     child: Icon(Icons.add),
//     // //     onPressed: _increaseCount,
//     // //   ),
//     // // );
//   }
// }

//需要的参数放在这里
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  //父类构造函数
  CounterProvider(this.count, this.increaseCount, this.child)
      : super(child: child);
  // //静态方法 得到数据 count increaseCount
  // static CounterProvider of(BuildContext context) =>
  //     context.inheritFromWidgetOfExactType(CounterProvider);
  static CounterProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: CounterProvider);

  //是否通知继承此部件的部件
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}

//多层引用,导致问题:底层需要参数与中间层无关也要使用.
//可以通过 继承 InheritedWidget来实现
//第一层
class CounterWrapper extends StatelessWidget {
  // final int count;
  // //回调类型属性
  // final VoidCallback increaseCount;
  // CounterWrapper(this.count, this.increaseCount);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

//第二层
class Counter extends StatelessWidget {
  // final int count;
  // //回调类型属性
  // final VoidCallback increaseCount;
  // Counter(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    //自带类和方法
    // //使用InheritedWidget,属性放在build中
    // final int count = CounterProvider.of(context).count;
    // final VoidCallback increaseCount =
    //     CounterProvider.of(context).increaseCount;
    // return ActionChip(
    //   label: Text('$count'),
    //   onPressed: increaseCount,
    // );

    //第三方类和方法
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
        label: Text('${model.count}'),
        onPressed: model.increaseCount,
      ),
    );
  }
}

//第三方
class CounterModel extends Model {
  //属性
  int _count = 0;
  //get方法
  int get count => _count;

  void increaseCount() {
    _count++;
    //监听model变化,使用此方法,小部件会重建
    notifyListeners();
  }
}
// //无状态部件,不会变化
// class StateManagementDemo extends StatelessWidget {
//    int count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('StateManagementDemo'),
//         elevation: 0.0,
//       ),
//       body: Center(
//         child: Chip(
//           label: Text('$count'),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: (){
//           this.count++;
//           print(this.count);
//         },
//       ),
//     );
//   }
// }

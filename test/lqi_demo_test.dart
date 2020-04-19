import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/demo/test/test_demo.dart';

//方法测试
void main() {
  test('shoule return hello + name', () {
    var string = LqiTestDemo.greet('lqixy');

    expect(string, 'hello lqixy');
  });

  //小部件测试
  testWidgets('widget testing demo', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TestDemo(),
    ));
    //在TestDemo中查找文本小部件，显示hello
    final labelText = find.text('hello');
    expect(labelText, findsOneWidget);

    //找到文本包含0的小部件
    final actionChipLabelText = find.text('0');
    expect(actionChipLabelText, findsOneWidget);

    //根据类型查找
    final actionChip = find.byType(ActionChip);
    //点按
    await tester.tap(actionChip);
    //重建
    await tester.pump();

    final actionChipLabelTextAfterTap = find.text('1');
    expect(actionChipLabelTextAfterTap, findsOneWidget);
    expect(actionChipLabelText, findsNothing);
  });
}
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    FlutterDriver driver;
 
    //运行之前要做的事情
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    //断开连接
    tearDownAll(() {
      if (driver != null) {
        driver.close();
      }
    });
  });
}

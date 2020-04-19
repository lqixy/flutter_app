import 'package:flutter_driver/driver_extension.dart';
import 'package:my_app/main.dart' as app;

//集成测试
void main(){
  enableFlutterDriverExtension();

  app.main();
}
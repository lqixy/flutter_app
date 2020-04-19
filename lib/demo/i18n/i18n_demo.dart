import 'package:flutter/material.dart';

import 'map/lqi_demo_localizations.dart';

//本地化
class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //本地化的配置信息
    Locale locale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${locale.toString()}'),
            Text(
              //  //使用系统方法
              // Localizations.of(context, LqiDemoLocalizations).title,

              //使用自定义of方法，在自定义类中声明一个静态of方法
              LqiDemoLocalizations.of(context).title,
              style: Theme.of(context).textTheme.title,
            )
          ],
        ),
      ),
    );
  }
}

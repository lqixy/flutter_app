import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LqiDemoLocalizations {
  final Locale locale;

  LqiDemoLocalizations(this.locale);

  
  static LqiDemoLocalizations of(BuildContext context){
    return Localizations.of<LqiDemoLocalizations>(context, LqiDemoLocalizations);
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {'title': '你好'}
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class LqiDemoLocalizationsDelegate
    extends LocalizationsDelegate<LqiDemoLocalizations> {
  LqiDemoLocalizationsDelegate();

  //加载包含本地化的对象
  @override
  Future<LqiDemoLocalizations> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<LqiDemoLocalizations>(
        LqiDemoLocalizations(locale));
  }

  //判断load方法加载的对象是否合法
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return true;
  }


  @override
  bool shouldReload(LocalizationsDelegate<LqiDemoLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }
}

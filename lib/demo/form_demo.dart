import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
        elevation: 0,
      ),
      body: Theme(
        //Theme.of(context).copyWith(xx) 只改变(xxx)
        data: Theme.of(context).copyWith(primaryColor: Colors.black),

        // //使用ThemeData完全改变主题
        // data:ThemeData(
        //   primaryColor: Colors.black
        // ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              RegisterForm(),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  //定义key
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;
  //提交方法
  void submitRegisterForm() {
    //如果验证通过，执行保存
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      print('username: $username');
      print('password: $password');

      //底部弹出对话框
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Registering'),
      ));
    } else {
      //打开自动验证
      setState(() {
        autovalidate = true;
      });
    }
    // //执行key中的save()
    // registerFormKey.currentState.save();
    // //执行key中的validate()
    // registerFormKey.currentState.validate();
  }

  //自定义验证方法
  String validateUsername(v) {
    if (v.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String validatePassword(v) {
    if (v.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      //指定key
      key: this.registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                labelText: 'userName',
                //帮助信息：验证有误时展示
                helperText: 'is not empty'),
            //保存事件
            onSaved: (v) {
              username = v;
            },

            //表单验证
            validator: validateUsername,
            //自动验证
            autovalidate: autovalidate,
          ),
          TextFormField(
            //不明示文本框内容
            obscureText: true,
            decoration: InputDecoration(labelText: 'password', helperText: ''),
            //保存事件
            onSaved: (v) {
              password = v;
            },
            validator: validatePassword,
            autovalidate: autovalidate,
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0,
              //点击，调用自定义提交方法
              onPressed: submitRegisterForm,
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

//释放控制器
  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();

    super.dispose();
  }

  //初始化
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // textEditingController.text = 'hi';
    textEditingController.addListener(() {
      print('input: ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      //文本框控制器
      controller: textEditingController,

      // //文本框中变化事件
      // onChanged: (v){
      //   print('input: $v');
      // },

      //按下确定按钮事件
      onSubmitted: (v) {
        print('submit: $v');
      },
      //文本框样式
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        //提示文本
        hintText: 'Enter the post title.',
        // //设置输入框无边框样式
        // border: InputBorder.none,
        // // 设置输入框四周边框
        // border: OutlineInputBorder(),

        // //带背景色输入框
        // filled: true,
        // //背景颜色
        // fillColor: Colors.white10
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //Theme.of(context).xxx读取在main中设置的属性
      color: Theme.of(context).accentColor,
    );
  }
}

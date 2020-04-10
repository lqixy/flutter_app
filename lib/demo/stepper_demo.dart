import 'package:flutter/material.dart';

//步骤
class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(primaryColor: Colors.black),
              child: Stepper(
                //当前步骤
                currentStep: _currentStep,
                //点击步骤区域
                onStepTapped: (v) {
                  setState(() {
                    this._currentStep = v;
                  });
                },
                //点击继续事件
                onStepContinue: () {
                  setState(() {
                    if (this._currentStep < 2) {
                      this._currentStep++;
                    } 
                  });
                },
                //点击取消事件
                onStepCancel: () {
                  setState(() {
                    if (this._currentStep > 0) {
                      this._currentStep--;
                    }  
                  });
                },
                steps: [
                  Step(
                      title: Text('Login'),
                      subtitle: Text('Login first'),
                      content: Text(
                          'Incididunt dolore proident aliqua eiusmod mollit pariatur nulla .'),
                      //是否开启
                      isActive: _currentStep == 0),
                  Step(
                      title: Text('Choose Plan'),
                      subtitle: Text('Choose you plan.'),
                      content: Text('Eu cupidatat veniam tempor.'),
                      //是否开启
                      isActive: _currentStep == 1),
                  Step(
                      title: Text('Confirm payment'),
                      subtitle: Text('Confirm your payment method.'),
                      content: Text('Fugiat ullamco magna aliqua sit.'),
                      //是否开启
                      isActive: _currentStep == 2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

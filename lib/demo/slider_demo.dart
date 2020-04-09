import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItemA = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Slider(
                    inactiveColor:
                        Theme.of(context).accentColor.withOpacity(0.3),
                    activeColor: Theme.of(context).accentColor,
                    onChanged: (v) {
                      print(v);
                      setState(() {
                        this._sliderItemA = v;
                      });
                    },
                    max: 10,
                    min: 0,
                    //分段
                    divisions: 10,
                    //拖动标签
                    label: '${this._sliderItemA.toInt()}',
                    value: _sliderItemA,
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Text('SliderValue: $_sliderItemA')
            ],
          )),
    );
  }
}

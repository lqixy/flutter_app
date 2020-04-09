import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//日期
class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);

  //时间选择
  Future<void> _selectTime() async {
    final TimeOfDay time =
        await showTimePicker(context: context, initialTime: selectedTime);

    if (time == null) return;

    setState(() {
      this.selectedTime = time;
    });
  }

  //日期选择
  Future<void> _selectDate() async {
    //时间控件
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: this.selectedDate,
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    setState(() {
      this.selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DateTimeDemo'),
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
                    //给任意组件添加点击事件
                    InkWell(
                      onTap: _selectDate,
                      child: Row(
                        children: <Widget>[
                          Text(DateFormat.yMMMd().format(selectedDate)),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: _selectTime,
                      child: Row(
                        children: <Widget>[
                          Text(selectedTime.format(context)),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}

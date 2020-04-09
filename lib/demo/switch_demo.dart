import 'package:flutter/material.dart';

//Switch
class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchItemA = false;
  void _switchItemChanged(v) {
    setState(() {
      print(v);
      this._switchItemA = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Switch Demo')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              value: _switchItemA,
              onChanged: (v) {
                setState(() {
                  this._switchItemA = v;
                });
              },
              title: Text('Switch Item A'),
              subtitle: Text('Description'),
              secondary:
                  Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
              selected: _switchItemA,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Text(_switchItemA?'smile':'cry'),
                // Switch(
                //   value: _switchItemA,
                //   onChanged: _switchItemChanged,
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}

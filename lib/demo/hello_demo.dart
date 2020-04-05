import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  const Hello({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hello',
        style: TextStyle(
          fontSize: 40,
          color: Colors.black,
        ),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

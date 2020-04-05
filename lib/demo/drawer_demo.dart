import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    'Kyle',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text('kyle@qq.com'),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.itying.com/images/flutter/1.png')),
                  decoration: BoxDecoration(
                      color: Colors.yellow[400],
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://www.itying.com/images/flutter/2.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.yellow[400].withOpacity(0.6),
                              BlendMode.hardLight))),
                ),
                ListTile(
                  title: Text(
                    'Message',
                    textAlign: TextAlign.right,
                  ),
                  leading: Icon(
                    Icons.message,
                    color: Colors.black12,
                    size: 22,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  title: Text(
                    'Favorite',
                    textAlign: TextAlign.right,
                  ),
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.black12,
                    size: 22,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Settings',
                    textAlign: TextAlign.right,
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.black12,
                    size: 22,
                  ),
                )
              ],
            ),
          );
  }
}
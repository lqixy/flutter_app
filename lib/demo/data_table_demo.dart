import 'package:flutter/material.dart';
import 'package:my_app/model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortIndex = 0;
  bool _sortAscending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            //数据表格
            // DataTable(
            //   columns: [
            //     DataColumn(label: Text('Title')),
            //     DataColumn(label: Text('Author')),
            //   ],
            //   rows: [
            //     DataRow(cells: [
            //       DataCell(Text('hello')),
            //       DataCell(Text('world')),
            //     ])
            //   ],
            // ),

            DataTable(
              sortColumnIndex: _sortIndex,
              sortAscending: _sortAscending,
              // onSelectAll: (v){},
              columns: [
                DataColumn(
                    label: Text('Title'),
                    //排序
                    onSort: (index, sort) {
                      setState(() {
                        this._sortIndex = index;
                        this._sortAscending = sort;
                        posts.sort((a, b) {
                          if (!sort) {
                            final c = a;
                            a = b;
                            b = c;
                          }
                          return a.title.length.compareTo(b.title.length);
                        });
                      });
                    }),
                DataColumn(
                    label: Text('Author'),
                    onSort: (index, sort) {
                      setState(() {
                        this._sortIndex = index;
                        this._sortAscending = sort;
                        posts.sort((a, b) {
                          if (!sort) {
                            final c = a;
                            a = b;
                            b = c;
                          }
                          return a.author.length.compareTo(b.author.length);
                        });
                      });
                    }),
                DataColumn(
                    label: Container(
                  width: 150,
                  child: Text('Image'),
                )),
              ],
              rows: posts.map((x) {
                return DataRow(
                    //选择项
                    selected: x.selected,
                    //选择事件
                    onSelectChanged: (v) {
                      setState(() {
                        if (x.selected != v) {
                          x.selected = v;
                        }
                      });
                    },
                    cells: [
                      DataCell(Text(x.title)),
                      DataCell(Text(x.author)),
                      DataCell(Image(
                          image: NetworkImage(x.imageUrl), fit: BoxFit.fill)),
                    ]);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

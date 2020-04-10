import 'package:flutter/material.dart';
import '../model/post.dart';

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final Post post = this._posts[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text(post.title)),
      DataCell(Text(post.author)),
      DataCell(Image(image: NetworkImage(post.imageUrl), fit: BoxFit.fill)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  //行数
  @override
  int get rowCount => _posts.length;

  //选中行
  @override
  int get selectedRowCount => _selectedCount;

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortIndex = 0;
  bool _sortAscending = false;

  final PostDataSource _postsDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(children: [
          PaginatedDataTable(
            //表头
            header: Text('Posts'),
            //每页行数
            rowsPerPage: 5,
            //数据源
            source: _postsDataSource,
            sortColumnIndex: _sortIndex,
            sortAscending: _sortAscending,
            // onSelectAll: (v){},
            columns: [
              DataColumn(
                  label: Text('Title'),
                  //排序
                  onSort: (columnIndex, sort) {
                    _postsDataSource._sort((post) => post.title.length, sort);

                    setState(() {
                      this._sortIndex = columnIndex;
                      this._sortAscending = sort;
                    });
                  }),
              DataColumn(
                  label: Text('Author'),
                  onSort: (columnIndex, sort) {
                    _postsDataSource._sort((post) => post.title.length, sort);
                    setState(() {
                      this._sortIndex = columnIndex;
                      this._sortAscending = sort;
                    });
                  }),
              DataColumn(
                  label: Container(
                width: 150,
                child: Text('Image'),
              )),
            ],
          ),
        ]),
      ),
    );
  }
}

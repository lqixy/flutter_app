import 'package:flutter/material.dart';
import 'package:my_app/demo/alert_dialog_demo.dart';
import 'package:my_app/demo/bottom_sheet_demo.dart';
import 'package:my_app/demo/card_demo.dart';
import 'package:my_app/demo/chip_demo.dart';
import 'package:my_app/demo/data_table_demo.dart';
import 'package:my_app/demo/datetime_demo.dart';
import 'package:my_app/demo/expansion_panel_demo.dart';
import 'package:my_app/demo/paginated_data_table_demo.dart';
import 'package:my_app/demo/simple_dialog_demo.dart';
import 'package:my_app/demo/snack_bar_demo.dart';
import 'package:my_app/demo/stepper_demo.dart';
import '../demo/button_demo.dart';
import '../demo/floating_action_button_demo.dart';
import '../demo/popup_menu_button_demo.dart';
import '../demo/form_demo.dart';
import '../demo/checkbox_demo.dart';
import '../demo/radio_demo.dart';
import '../demo/switch_demo.dart';
import '../demo/slider_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: 'Stepper',
            subtitle: '步骤',
            page: StepperDemo(),
          ),
          ListItem(
            title: 'Card',
            subtitle: '卡片',
            page: CardDemo(),
          ),
          ListItem(
            title: 'PaginatedDataTable',
            subtitle: '分页图表',
            page: PaginatedDataTableDemo(),
          ),
          ListItem(
            title: 'DataTable',
            subtitle: '图表',
            page: DataTableDemo(),
          ),
          ListItem(
            title: 'Chip',
            subtitle: '碎片',
            page: ChipDemo(),
          ),
          ListItem(
            title: 'ExpansionPanel',
            subtitle: '收缩面板',
            page: ExpansionPanelDemo(),
          ),
          ListItem(
            title: 'SnackBar',
            subtitle: '短暂底部弹框',
            page: SnackBarDemo(),
          ),
          ListItem(
            title: 'BottomSheet',
            subtitle: '固定底部弹框',
            page: BottomSheetDemo(),
          ),
          ListItem(
            title: 'AlertDialog',
            subtitle: '警告对话框',
            page: AlertDialogDemo(),
          ),
          ListItem(
            title: 'SimpleDialog',
            subtitle: '简单对话框',
            page: SimpleDialogDemo(),
          ),
          ListItem(
            title: 'DateTime',
            subtitle: '日期',
            page: DateTimeDemo(),
          ),
           ListItem(
            title: 'Slider',
            subtitle: '滑块',
            page: SliderDemo(),
          ),
          ListItem(
            title: 'Switch',
            subtitle: '开关',
            page: SwitchDemo(),
          ),
          ListItem(
            title: 'Radio',
            subtitle: '单选',
            page: RadioDemo(),
          ),
          ListItem(
            title: 'Checkbox',
            subtitle: '复选框',
            page: CheckboxDemo(),
          ),
          ListItem(
            title: 'Form',
            subtitle: '表单',
            page: FormDemo(),
          ),
          ListItem(
            title: 'FloatingActionButton',
            subtitle: '浮动按钮',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'Button',
            subtitle: '按钮',
            page: ButtonDemo(),
          ),
          ListItem(
              title: 'PopupMenuButton',
              subtitle: '弹出式菜单按钮',
              page: PopupMenuButtonDemo())
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;
  final String subtitle;
  ListItem({this.title, this.subtitle = '', this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/components/best_list/best_list_view_model.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';

class BestList extends StatelessWidget {
  BestList();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<BestListViewModel>(
        onModelReady: (model) => model.initialise(),
        model: locator<BestListViewModel>(),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : BestListView(model.bestlist));
  }
}

class BestListView extends StatelessWidget {
  final List<User> _userList;

  const BestListView(this._userList);

  @override
  Widget build(BuildContext context) {
    var counter = 0;
    return Expanded(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Text('#'),
            tooltip: 'Position',
          ),
          DataColumn(
            label: Text('Bild'),
            tooltip: 'Bild',
          ),
          DataColumn(
            label: Text('Name'),
            tooltip: 'Name',
          ),
          DataColumn(
            label: Text('Zapfmenge'),
            tooltip: 'Zapfmenge',
          )
        ],
        rows: _userList.map((user) {
          counter = counter + 1;
          return DataRow(cells: [
            DataCell(Text('$counter.')),
            DataCell(CircleAvatar(backgroundImage: AssetImage(user.imagePath))),
            DataCell(Text(user.name)),
            DataCell(Text("${user.tappedAmount} L")),
          ]);
        }).toList(),
      ),
    ));
  }
}

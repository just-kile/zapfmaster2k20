import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/bestlist/best_list_item_dto.dart';
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
  final List<BestListItemDto> _bestList;

  const BestListView(this._bestList);

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
        rows: _bestList.map((bestListItem) {
          counter = counter + 1;
          return DataRow(cells: [
            DataCell(Text('$counter.')),
            DataCell(bestListItem.user.imagePath != null
                ? CircleAvatar(
                    backgroundImage: AssetImage(bestListItem.user.imagePath))
                : CircleAvatar(
                    backgroundImage: AssetImage("assets/testUser.jpg"))),
            DataCell(Text(bestListItem.user.name)),
            DataCell(Text("${bestListItem.amount?.toStringAsFixed(2)} L")),
          ]);
        }).toList(),
      ),
    ));
  }
}

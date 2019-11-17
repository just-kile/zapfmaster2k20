import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/ui/components/best_list/best_list_view_model.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';
import 'package:zapfmaster2k20/ui/shared/ui_helpers.dart';

class BestList extends StatelessWidget {
  BestList();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<BestListViewModel>(
        onModelReady: (model) => model.initialise(),
        model: BestListViewModel(db: Provider.of(context)),
        builder: (context, model, child) =>
        model.busy
            ? Center(
          child: CircularProgressIndicator(),
        )
            : StreamProvider<List<User>>.value(
            initialData: [],
            value: model.bestList,
            child: BestListView()));
  }
}

class BestListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userList = Provider.of<List<User>>(context);
    return Expanded(
      child: ListView.builder(
        itemCount: _userList.length,
        itemBuilder: (context, index) =>
            BestListItem(_userList[index]),
      ),
    );
  }
}

/// Renders a single comment given a comment model
class BestListItem extends StatelessWidget {
  final User user;

  const BestListItem(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color.fromARGB(255, 255, 246, 196)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall,
          Text(user.name),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/components/best_list/best_list_view_model.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';
import 'package:zapfmaster2k20/ui/shared/ui_helpers.dart';

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
    return Expanded(
      child: ListView.builder(
        itemCount: _userList.length,
        itemBuilder: (context, index) => BestListItem(_userList[index]),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(user.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

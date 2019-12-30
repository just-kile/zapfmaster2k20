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
    return Expanded(
      child: ListView.builder(
        itemCount: _userList.length,
        itemBuilder: (context, index) => BestListItem(_userList[index], index),
      ),
    );
  }
}

/// Renders a single comment given a comment model
class BestListItem extends StatelessWidget {
  final User user;

  final int index;

  const BestListItem(this.user, this.index);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.transparent,
        shape: new RoundedRectangleBorder(
            side: new BorderSide(color: Colors.orange, width: 2.0),
            borderRadius: BorderRadius.circular(4.0)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/testUser.jpg")),
              title: Text(this.user.name),
              subtitle: Text('Achievements:'),
              trailing: Text("${user.tappedAmount} L"),
            ),
          ],
        ),
      ),
    );
  }
}

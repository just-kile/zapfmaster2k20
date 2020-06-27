import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';

import 'new_user_page_view_model.dart';
import 'revert_draft_page_view_model.dart';

class NewUserPage extends StatelessWidget {
  NewUserPage();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<NewUserPageViewModel>(
        onModelReady: (model) => model.initialise(),
        model: locator<NewUserPageViewModel>(),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(child: buildContent(model)));
  }

  Widget buildContent(NewUserPageViewModel model) => Scaffold(
      appBar: AppBar(
        title: Text("Neuer Trinker"),
      ),
      body: ListView(children: <Widget>[
        Text('Rückgänging', style: TextStyle(fontSize: 20)),
      ]));
}

import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';

import 'new_keg_page_view_model.dart';
import 'revert_draft_page_view_model.dart';

class NewKegPage extends StatelessWidget {
  NewKegPage();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<NewKegPageViewModel>(
        onModelReady: (model) => model.initialise(),
        model: locator<NewKegPageViewModel>(),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : buildContent(model));
  }

  Widget buildContent(NewKegPageViewModel model) => Scaffold(
      appBar: AppBar(
        title: Text("Neues Fass"),
      ),
      body: ListView(children: <Widget>[
        Text('Rückgänging', style: TextStyle(fontSize: 20)),
      ]));
}

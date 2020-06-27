import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';

import 'revert_draft_page_view_model.dart';

class RevertDraftPage extends StatelessWidget {
  RevertDraftPage();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<RevertDraftPageViewModel>(
        onModelReady: (model) => model.initialise(),
        model: locator<RevertDraftPageViewModel>(),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(child: buildContent(model)));
  }

  Widget buildContent(RevertDraftPageViewModel model) => Scaffold(
      appBar: AppBar(
        title: Text("Rückgängig"),
      ),
      body: ListView(children: <Widget>[
        Text('Rückgänging', style: TextStyle(fontSize: 20)),
      ]));
}

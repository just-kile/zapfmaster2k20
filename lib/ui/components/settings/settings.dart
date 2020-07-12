import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/components/settings/pages/new_keg_page.dart';
import 'package:zapfmaster2k20/ui/components/settings/pages/new_user_page.dart';
import 'package:zapfmaster2k20/ui/components/settings/pages/select_user_page.dart';
import 'package:zapfmaster2k20/ui/shared/app_scaffold.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';

import 'pages/revert_draft_page.dart';
import 'settings_view_model.dart';

class Settings extends StatelessWidget {
  Settings();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SettingsViewModel>(
        onModelReady: (model) => model.initialise(),
        model: locator<SettingsViewModel>(),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(child: buildContent(model, context)));
  }

  Widget buildContent(SettingsViewModel model, BuildContext context) =>
      ListView(children: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => withBackgroundImage(RevertDraftPage())),
            );
          },
          child: const Text('Zapfvorgänge bearbeiten', style: TextStyle(fontSize: 20)),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => withBackgroundImage(NewKegPage())),
            );
          },
          child: const Text('Neues Fass', style: TextStyle(fontSize: 20)),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => withBackgroundImage(NewUserPage())),
            );
          },
          child: const Text('Neuer Trinker', style: TextStyle(fontSize: 20)),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => withBackgroundImage(SelectUserPage())),
            );
          },
          child: const Text('Trinker editieren', style: TextStyle(fontSize: 20)),
        ),
      ]);
}

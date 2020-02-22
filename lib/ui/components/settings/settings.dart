import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';

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
            : Expanded(child: Text("Settings")));
  }
}

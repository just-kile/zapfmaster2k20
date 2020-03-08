import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';

import 'tappings_view_model.dart';

class Tapping extends StatelessWidget {
  final UserDto loggedInUser;

  const Tapping({Key key, this.loggedInUser}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BaseWidget<TappingViewModel>(
        onModelReady: (model) => model.initialise(loggedInUser),
        model: locator<TappingViewModel>(),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Text("User ${model.state?.userDto?.name} ${model.state?.amount}"));
  }
}

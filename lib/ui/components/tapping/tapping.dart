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
            : buildUserCard(model));
  }

  buildUserCard(TappingViewModel model) => Center(
          child: Container(
        height: 300,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/app_icon.png', fit: BoxFit.cover),
            Container(
                child: Text("${model.state?.amount} L",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40))),
            ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/testUser.jpg")),
                title: Text("${model.state?.userDto?.name}")),
            ListTile(leading: Text("Achievements")),
          ],
        ),
      ));
}
//Image.asset('assets/app_icon.png', fit: BoxFit.cover)
//Text("User ${model.state?.userDto?.name} ${model.state?.amount}")

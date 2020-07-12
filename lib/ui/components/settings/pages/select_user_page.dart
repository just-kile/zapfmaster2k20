import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/components/settings/pages/new_user_page.dart';
import 'package:zapfmaster2k20/ui/components/settings/pages/select_user_page_view_model.dart';
import 'package:zapfmaster2k20/ui/shared/app_scaffold.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';

import 'new_user_page_view_model.dart';

class SelectUserPage extends StatelessWidget {
  UserDto user;

  SelectUserPage();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SelectUserPageViewModel>(
        onModelReady: (model) => model.initialise(user),
        model: locator<SelectUserPageViewModel>(),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(child: Container(child: buildContent(model, context))));
  }

  Widget buildContent(SelectUserPageViewModel model, BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Trinker zum Bearbeiten auswählen"),
        ),
        body: ListView.builder(
          itemCount: model.list.length,
          itemBuilder: (context, index) {
            var user = model.list[index];
            return RaisedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          withBackgroundImage(NewUserPage.withUser(user))),
                );
              },
              child: Text(user.name),
            );
          },
        ));
  }
}

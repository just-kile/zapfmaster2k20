import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';

import 'new_user_page_view_model.dart';

class NewUserPage extends StatelessWidget {
  UserDto user;

  NewUserPage();

  NewUserPage.withUser(UserDto user) {
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<NewUserPageViewModel>(
        onModelReady: (model) => model.initialise(user),
        model: locator<NewUserPageViewModel>(),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(child: buildContent(model, context)));
  }

  Widget buildContent(NewUserPageViewModel model, BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: Text("Neuer Trinker"),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: model.userNameController,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Bitte einen Namen eingeben';
                      }
                      if (model.token == null) {
                        return 'Bitte eine unbenutzte Karte scannen';
                      }
                      return null;
                    },
                  ),
                  Center(
                      child: Container(
                          height: 300,
                          width: 300,
                          child: model.imagePath == null
                              ? CameraPreview(model.cameraController)
                              : Image.file(File(model.imagePath)))),
                  ButtonBar(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () async {
                          model.takePhoto();
                        },
                        child: const Text('Foto aufnehmen'),
                      ),
                      RaisedButton(
                        onPressed: () async {
                          model.resetImage();
                        },
                        child: const Text('Reset Foto'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(model.token == null
                        ? "Karte noch nicht erkannt"
                        : "Karte erkannt!"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await model.createUser();
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            )));
  }
}

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';

import 'new_user_page_view_model.dart';

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
            : Expanded(child: buildContent(model, context)));
  }

  Widget buildContent(NewUserPageViewModel model, BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: Text("Neuer Trinker"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: model.userNameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Bitte einen Namen eingeben';
                  }
                  if(model.token == null){
                    return 'Bitte eine unbenutzte Karte scannen';
                  }
                  return null;
                },
              ),
//              CameraPreview(model.cameraController),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () async {
                    model.takePhoto();
                  },
                  child: Text('Foto aufnehmen'),
                ),
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
        ));
  }
}

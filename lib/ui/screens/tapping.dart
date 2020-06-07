import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/ui/components/tapping/tapping.dart'
    as TappingComponent;

class Tapping extends StatelessWidget {
  final UserDto loggedInUser;

  const Tapping({Key key, this.loggedInUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zapfvorgang"),
      ),
      body: TappingComponent.Tapping(loggedInUser: this.loggedInUser),
    );
  }
}

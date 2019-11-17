import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/constants/app_contstants.dart';
import 'package:zapfmaster2k20/ui/components/best_list/best_list.dart';
import 'package:zapfmaster2k20/ui/shared/ui_helpers.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 241, 159),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge,
            UIHelper.verticalSpaceMedium,
            BestList()
          ],
        ),
      ),
    );
  }

  RaisedButton buildRaisedButton(BuildContext context) {
    return RaisedButton(
      child: Text('Open routeee'),
      onPressed: () {
        Navigator.pushNamed(context, RoutePaths.Details);
      },
    );
  }
}

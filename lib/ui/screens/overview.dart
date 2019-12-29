import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/ui/components/best_list/best_list.dart';
import 'package:zapfmaster2k20/ui/shared/ui_helpers.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/drops.png"),
//            fit: BoxFit.fitWidth,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UIHelper.verticalSpaceLarge,
              UIHelper.verticalSpaceMedium,
              BestList()
            ],
          ),
        ) ,
      ),
    );
  }
}

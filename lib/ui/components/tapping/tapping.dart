import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/components/newsfeed/news_feed_view_model.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';

import 'tappings_view_model.dart';

class Tapping extends StatelessWidget {
  Tapping();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TappingViewModel>(
        onModelReady: (model) => model.initialise(),
        model: locator<TappingViewModel>(),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Text("User ${model.state?.userDto?.name} ${model.state?.amount}"));
  }
}

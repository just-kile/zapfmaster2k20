import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/components/best_list/best_list_view_model.dart';
import 'package:zapfmaster2k20/ui/components/newsfeed/news_feed_view_model.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';
import 'package:zapfmaster2k20/ui/shared/ui_helpers.dart';

class NewsFeed extends StatelessWidget {
  NewsFeed();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<NewsFeedViewModel>(
        onModelReady: (model) => model.initialise(),
        model: locator<NewsFeedViewModel>(),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Text("Fooo"));
  }
}

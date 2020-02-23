import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/components/newsfeed/news_feed_view_model.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';

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
            : Expanded(
                child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => Card(
                  color: Colors.transparent,
                  shape: new RoundedRectangleBorder(
                      side: new BorderSide(color: Colors.orange, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                            backgroundImage: AssetImage("assets/testUser.jpg")),
                        title: Text("Test"),
                        subtitle: Text('Achievements:'),
                        trailing: Text("L"),
                      ),
                    ],
                  ),
                ),
              )));
  }
}

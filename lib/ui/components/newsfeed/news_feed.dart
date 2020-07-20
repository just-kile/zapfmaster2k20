import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/db/domain/news_item.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/components/newsfeed/news_feed_view_model.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';
import 'package:zapfmaster2k20/ui/shared/user_image.dart';

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
            : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: model.news.length + 1,
                itemBuilder: (context, index) {
                  if (index < model.news.length) {
                    return buildCard(model.news[index]);
                  } else {
                    model.loadMoreData();
                    return model.lastItemLoaded
                        ? null
                        : Center(child: CircularProgressIndicator());
                  }
                },
              ));
  }

  Card buildCard(NewsItem newsItem) {
    if (newsItem.details is UserTappedNewsDetails) {
      return buildUserTappedCard(newsItem);
    }
    return Card();
  }

  Card buildUserTappedCard(NewsItem newsItem) {
    return Card(
      color: Colors.transparent,
      shape: new RoundedRectangleBorder(
          side: new BorderSide(color: Colors.orange, width: 2.0),
          borderRadius: BorderRadius.circular(4.0)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(backgroundImage: UserImage(newsItem.user)),
            title: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: "${newsItem.user?.name}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' hat erfolgreich '),
                  TextSpan(
                      text: '${newsItem.drawing?.amount?.toStringAsFixed(2)} L',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' gezapft!'),
                ],
              ),
            ),
            subtitle: Text('am ${newsItem.drawing?.createdAt}'),
            trailing: Text("L"),
          ),
        ],
      ),
    );
  }
}

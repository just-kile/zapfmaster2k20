import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zapfmaster2k20/core/db/domain/news_item.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/components/newsfeed/news_feed_view_model.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';
import 'package:zapfmaster2k20/ui/shared/user_image.dart';

class NewsFeed extends StatelessWidget {
  var formatter = DateFormat('dd.MM.yyyy HH:mm');

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
    if (newsItem.details is NewAchievementReachedNewsDetails) {
      return buildAchievementCard(newsItem);
    }
    return Card(child: Text(newsItem.toString()));
  }

  Card buildAchievementCard(NewsItem newsItem) => buildBaseCard(
      Colors.blue,
      newsItem.user,
      newsItem.createdAt,
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: "${newsItem.user?.name}",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' hat das Achievement '),
            TextSpan(
                text: '${newsItem.achievement?.title} ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' erreicht!'),
            TextSpan(
                text: "\n(${newsItem.achievement.description})",
                style: TextStyle(fontSize: 12))
          ],
        ),
      ),
      AssetImage(newsItem.achievement.imagePath));

  Card buildUserTappedCard(NewsItem newsItem) => buildBaseCard(
      Colors.orange,
      newsItem.user,
      newsItem.createdAt,
      RichText(
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
      UserImage(newsItem.user));

  Card buildBaseCard(MaterialColor borderColor, UserDto user,
      DateTime createdAt, RichText title, ImageProvider image) {
    return Card(
      color: Colors.transparent,
      shape: new RoundedRectangleBorder(
          side: new BorderSide(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.circular(4.0)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(backgroundImage: image),
            title: title,
            subtitle: Text('am ${formatter.format(createdAt)}'),
          ),
        ],
      ),
    );
  }
}

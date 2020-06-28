import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/db/domain/drawing_dto.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/components/settings/pages/revert_draft_page_view_model.dart';
import 'package:zapfmaster2k20/ui/shared/base_widget.dart';
import 'package:zapfmaster2k20/ui/shared/user_image.dart';

class RevertDraftPage extends StatelessWidget {
  RevertDraftPage();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<RevertDraftPageViewModel>(
        onModelReady: (model) => model.initialise(),
        model: locator<RevertDraftPageViewModel>(),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: Scaffold(
                    appBar: AppBar(
                      title: Text("News Bearbeiten"),
                    ),
                    body: ListView.builder(
                      itemCount: model.news.length + 1,
                      itemBuilder: (context, index) {
                        if (index < model.news.length) {
                          return buildCard(model.news[index], model);
                        } else {
                          model.loadMoreData();
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ))));
  }

  Card buildCard(DrawingWithUserDto newsItem, RevertDraftPageViewModel model) {
    return buildUserTappedCard(newsItem, model);
  }

  Card buildUserTappedCard(
      DrawingWithUserDto newsItem, RevertDraftPageViewModel model) {
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
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('Edit'),
                onPressed: () {},
              ),
              FlatButton(
                child: const Text('X'),
                onPressed: () {
                  model.deleteItem(newsItem);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

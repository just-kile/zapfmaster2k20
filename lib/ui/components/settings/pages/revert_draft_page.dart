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
            : Scaffold(
                appBar: AppBar(
                  title: Text("News Bearbeiten"),
                ),
                body: ListView.builder(
                  itemCount: model.news.length + 1,
                  itemBuilder: (context, index) {
                    if (index < model.news.length) {
                      return buildUserTappedCard(
                          model.news[index], model, context);
                    } else {
                      model.loadMoreData();
                      return model.lastItemLoaded == false
                          ? Center(child: CircularProgressIndicator())
                          : Center();
                    }
                  },
                )));
  }

  Card buildUserTappedCard(DrawingWithUserDto newsItem,
      RevertDraftPageViewModel model, BuildContext context) {
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
                onPressed: () {
                  _showDialog(context, newsItem, model);
                },
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

  _showDialog(BuildContext context, DrawingWithUserDto newsItem,
      RevertDraftPageViewModel model) async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext subContext) => AlertDialog(
              contentPadding: const EdgeInsets.all(16.0),
              content: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: model.editAmountController,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Menge', hintText: 'z.B. 2.32'),
                    ),
                  )
                ],
              ),
              actions: <Widget>[
                new FlatButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                new FlatButton(
                    child: const Text('Save'),
                    onPressed: () async {
                      await model.changeAmountOf(newsItem,
                          double.parse(model.editAmountController.text));
                      Navigator.pop(context);
                    })
              ],
            ));
  }
}

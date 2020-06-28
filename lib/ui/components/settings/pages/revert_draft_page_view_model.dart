import 'dart:async';

import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/db/domain/drawing_dto.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

import '../../../../locator.dart';

class RevertDraftPageViewModel extends BaseViewModel {
  final Zm2KDb _db = locator<Zm2KDb>();
  List<DrawingWithUserDto> news = [];
  bool lastItemLoaded = false;

  Future initialise() async {
    setBusy(true);
    this.news = await _db.drawingDao.getDrawings(0, 20);
    setBusy(false);
  }

  Future loadMoreData() async {
    if (lastItemLoaded) {
      return;
    }
    var additionalNews = await _db.drawingDao.getDrawings(news.length, 20);
    if (additionalNews.length == 0) {
      lastItemLoaded = true;
      return;
    }
    news.addAll(additionalNews);
    notifyListeners();
  }


  @override
  void dispose() {
    super.dispose();
  }

  void deleteItem(DrawingWithUserDto newsItem) async {
    print("Delete Item");
    await _db.drawingDao.deleteDrawing(newsItem.drawing);
    news.removeWhere((item) => item.drawing.id == newsItem.drawing.id);
    notifyListeners();

  }
}

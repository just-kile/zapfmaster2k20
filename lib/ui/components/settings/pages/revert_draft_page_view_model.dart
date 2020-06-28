import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/db/domain/drawing_dto.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

import '../../../../locator.dart';

class RevertDraftPageViewModel extends BaseViewModel {
  final Zm2KDb _db = locator<Zm2KDb>();
  List<DrawingWithUserDto> news = [];
  bool lastItemLoaded = false;
  final editAmountController = new TextEditingController();
  Future initialise() async {
    setBusy(true);
    await _refreshDrawingsList();
    setBusy(false);
  }

  Future<void> _refreshDrawingsList() async {
    this.news = await _db.drawingDao.getDrawings(0, 20);
  }

  Future loadMoreData() async {
    if (lastItemLoaded) {
      return;
    }
    var additionalNews = await _db.drawingDao.getDrawings(news.length, 20);
    if (additionalNews.length == 0) {
      lastItemLoaded = true;
      notifyListeners();
      return;
    }
    news.addAll(additionalNews);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    editAmountController.dispose();
  }

  void deleteItem(DrawingWithUserDto newsItem) async {
    print("Delete Item");
    await _db.drawingDao.deleteDrawing(newsItem.drawing);
    news.removeWhere((item) => item.drawing.id == newsItem.drawing.id);
    notifyListeners();
  }

  Future<void> changeAmountOf(DrawingWithUserDto newsItem, double amount) async {
    print("Update Item");
    await _db.drawingDao.updateDrawing(newsItem.drawing.id, amount);
    await _refreshDrawingsList();
    notifyListeners();
  }
}

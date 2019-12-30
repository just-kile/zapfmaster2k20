import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/ui/components/best_list/best_list.dart';
import 'package:zapfmaster2k20/ui/shared/app_scaffold.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return withAppScaffold(BestList(), 0);
  }
}

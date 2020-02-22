import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/ui/components/tapping/tapping.dart'
    as TappingComponent;
import 'package:zapfmaster2k20/ui/shared/app_scaffold.dart';

class Tapping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/app_icon.png', fit: BoxFit.cover),
      ),
      body: TappingComponent.Tapping(),
    );
  }
}

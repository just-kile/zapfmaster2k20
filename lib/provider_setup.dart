import 'package:provider/provider.dart';
import 'package:zapfmaster2k20/core/services/db.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Db())
];

List<SingleChildCloneableWidget> dependentServices = [
];

List<SingleChildCloneableWidget> uiConsumableProviders = [

];

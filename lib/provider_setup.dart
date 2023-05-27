import 'package:provider/single_child_widget.dart';
import 'res/import/import.dart';

// final locationProvider = ChangeNotifierProvider((ref) => LocationProvider());
// final authenticationProvider =
//     ChangeNotifierProvider((ref) => AuthenticationProvider());
// final propertyManagementProvider =
//     ChangeNotifierProvider((ref) => PropertyManagementProvider());

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [];

List<SingleChildWidget> dependentServices = [];

// Place All ChangeNotifierProvider's separated by a comma ","

List<SingleChildWidget> uiConsumableProviders = [];

import '../../view/screens/configure/configure.dart';
import '../../view/screens/scan/scan.dart';
import '../../view/screens/webview/webtoview.dart';
import '../import/import.dart';

class RouteNames {
  // All veiw route names
  static const splash = 'splash';
  static const scan = 'scan';
  static const configure = 'configure';
  static const customwebview = 'customwebview';

  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    ///RouteNames.splashScreen: (context) => SplashScreen(),

    scan: (context) => ScanScreen(),
    configure: (context) => ConfigureScreen(),
    // customwebview: (context) => CustomWebViewPage(),
  };
}

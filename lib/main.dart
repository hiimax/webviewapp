import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../res/import/import.dart';

final navigatorKey = GlobalKey<NavigatorState>();
var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory? dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox("app_data");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Future.delayed(Duration.zero).then((value) async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    await LocalStorage.setItem("device_token", '$deviceId');
    print('device token $value');
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: GetMaterialApp(
        builder: (BuildContext context, Widget? widget) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return CustomError(errorDetails: errorDetails);
          };
          return widget!;
        },

        debugShowCheckedModeBanner: false,
        title: AppName,
        theme: webviewapphelper.lightTheme(),
        initialRoute: '/',
        routes: RouteNames.routes,
        navigatorKey: navigatorKey,
        home: Builder(builder: (context) {
          SizeConfig.init(context);
          return SplashScreen();
        }),
      ),
    );
  }
}


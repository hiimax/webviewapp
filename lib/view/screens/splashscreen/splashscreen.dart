import 'package:get/get.dart';

import '../../../res/import/import.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: webviewappBlack,
      body: SafeArea(
        child: SplashScreenWidget(),
      ),
    );
  }
}

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
            title: 'SCAN',
            buttonColor: webviewappMainColor,
            onPressed: () async {
              // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              //     '#ff6666',
              //     'CANCEL_BUTTON_TEXT',
              //     false,
              //     ScanMode.DEFAULT);
              String barcodeScanRes;
              // Platform messages may fail, so we use a try/catch PlatformException.
              try {
                barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                    '#ff6666', 'Cancel', true, ScanMode.QR);
                print('barcodeScanRes $barcodeScanRes');
                if(barcodeScanRes != '-1')
                _handleURLButtonPress(context: context, url: barcodeScanRes, title: 'Live chat');
              } on PlatformException {
                barcodeScanRes = 'Failed to get platform version.';
              }
              // Get.toNamed(RouteNames.scan);
            },
          ),
          YMargin(11),
          CustomButton(
            title: 'CONFIGURE',
            buttonColor: webviewappPrimaryColor,
            onPressed: (){
              Get.toNamed(RouteNames.configure);
            },
          ),
        ],
      ),
    );
  }
}

void _handleURLButtonPress({required BuildContext context, required String url, required String title}) {

  Navigator.push(context,
      MaterialPageRoute(builder: (context) => CustomWebViewPage(url, title)));
}
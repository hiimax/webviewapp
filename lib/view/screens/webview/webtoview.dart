
import 'package:http/http.dart' as http;
import '../../../res/import/import.dart';


class CustomWebViewPage extends StatefulWidget {
  final String url;
  final String title;

  CustomWebViewPage(this.url, this.title);

  @override
  CustomWebViewPageState createState() => CustomWebViewPageState(this.url, this.title);
}

class CustomWebViewPageState extends State<CustomWebViewPage> {
  final String url;
  final String title;
  bool isLoading = true;
  CustomWebViewPageState(this.url, this.title);
  late WebViewController _webcontroller;
  String? _beforeCSS;
  String? _afterCSS;
  String? _beforeJS;
  String? _afterJS;
  @override
  void initState() {
    super.initState();
    _loadCSS();
    _loadJS();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  void _loadCSS() async {
    final beforeResponse = await http.get(Uri.parse('https://databular.app/cdn/moneypro/before.css'));
    final afterResponse = await http.get(Uri.parse('https://databular.app/cdn/moneypro/after.css'));
    setState(() {
      _beforeCSS = beforeResponse.body;
      _afterCSS = afterResponse.body;
    });

    print(_beforeCSS);
    print(_afterCSS);
  }

  void _loadJS() async {
    final beforeResponse = await http.get(Uri.parse('https://databular.app/cdn/moneypro/before.js'));
    final afterResponse = await http.get(Uri.parse('https://databular.app/cdn/moneypro/after.js'));
    setState(() {
      _beforeJS = beforeResponse.body;
      _afterJS = afterResponse.body;
    });
    print(_beforeJS);
    print(_afterJS);
  }

  void _injectCSS() async {
    if (_beforeCSS != null) {
      await _webcontroller.runJavascript('''
        var style = document.createElement('style');
        style.innerHTML = '$_beforeCSS';
        document.head.appendChild(style);
      ''');
    }
    if (_afterCSS != null) {
      await _webcontroller.runJavascript('''
        var style = document.createElement('style');
        style.innerHTML = '$_afterCSS';
        document.head.appendChild(style);
      ''');
    }
  }

  void _injectJS() async {
    if (_beforeJS != null) {
      await _webcontroller.runJavascript(_beforeJS!);
    }
    if (_afterJS != null) {
      await _webcontroller.runJavascript(_afterJS!);
    }
  }


  @override
  Widget build(BuildContext context) {
    _loadCSS();
    _loadJS();
    return Scaffold(
        body: Stack(children: [
          WebView(

            initialUrl: this.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webcontroller = webViewController;
              _injectCSS();
              _injectJS();
            },
            // navigationDelegate: (navigation) async {
            //   await Future.delayed(Duration(milliseconds: 100));
            //
            //   await _webcontroller.runJavascript('https://databular.app/cdn/moneypro/before.css');
            //   await _webcontroller.runJavascript('https://databular.app/cdn/moneypro/after.css');
            //   await _webcontroller.runJavascript('https://databular.app/cdn/moneypro/before.js');
            //   await _webcontroller.runJavascript('https://databular.app/cdn/moneypro/after.js');
            //   return NavigationDecision.navigate;  return NavigationDecision.navigate;
            //
            // },
            onPageFinished: (finish) {
              _injectCSS();
              _injectJS();
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
            child: CircularProgressIndicator( color: webviewappPrimaryColor,),
          )
              : SizedBox(),
        ]));
  }
}


import '../../res/import/import.dart';

class AuthenticationProvider extends ChangeNotifier with Validators {
  static AuthenticationProvider? _instance;
  // static late AuthService service;
  // static late ApiService apiService;

  AuthenticationProvider() {
    // service = AuthHttpService();
    // apiService = ApiServiceImpl();
  }

  static AuthenticationProvider get instance {
    if (_instance == null) {
      _instance = AuthenticationProvider();
    }
    return _instance!;
  }

  bool isLoading = false;

  final LocalAuthentication auth = LocalAuthentication();
  bool? _canCheckBiometrics;
  bool authenticated = false;
  bool enabledFingerprint = false;



  /// local authentication

  Future<void> enablefingerprint(context) async {
    final prefs = await SharedPreferences.getInstance();

    checkBiometrics();

    // checkBiometrics().then((_) {});
    if (_canCheckBiometrics == true) {
      try {
        notifyListeners();
        authenticated = await auth.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ),
        );
        notifyListeners();
        if (authenticated == true) {

        }
      } on PlatformException catch (e) {
        print(e);
        prefs.setBool('fingerprint', false);
        notifyListeners();
        return;
      }
      notifyListeners();
    } else {
      prefs.setBool('fingerprint', false);
      print('cant authenticate');
    }
  }

  Future<void> getfingerprint() async {
    final prefs = await SharedPreferences.getInstance();
    enabledFingerprint = prefs.getBool('fingerprint')!;
    print('enabledFingerprint $enabledFingerprint');
    notifyListeners();
  }

  Future<void> checkBiometrics() async {
    bool? canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.isDeviceSupported();
    } on PlatformException catch (e, s) {
      canCheckBiometrics = false;
      print(e);
      print(s);
    }
    _canCheckBiometrics = canCheckBiometrics;

    notifyListeners();
  }

  Future<void> authenticateWithBiometrics(context) async {
    checkBiometrics();

    // checkBiometrics().then((_) {});
    if (_canCheckBiometrics == true) {
      try {
        notifyListeners();
        authenticated = await auth.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
            useErrorDialogs: true,
            sensitiveTransaction: true,
          ),
        );
        notifyListeners();
        if (authenticated == true) {

        }
      } on PlatformException catch (e) {
        print(e);

        notifyListeners();
        return;
      }

      final String message = authenticated ? 'Authorized' : 'Not Authorized';

      print('message $message');
      notifyListeners();
    } else {
      print('cant authenticate');
    }
  }



  /// otp animation

  int _start = 30;
  Timer? _timer;

  int get start => _start;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start > 0) {
        _start--;
        notifyListeners();
      } else {
        _timer!.cancel();
        notifyListeners();
      }
    });
  }

  void resendCode({required Function() resendOtp}) {
    resendOtp();
    _start = 30;
    notifyListeners();
    startTimer();
    // Add code here to send the verification code again
  }
}

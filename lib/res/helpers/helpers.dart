import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../import/import.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

formatCurrency(dynamic value) {
  NumberFormat("#,##0.00", "en_US").format(value);
}

String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);
  return '${diff.inDays}';
}

void showErrorToast({String? message, int duration = 3}) {
  Get.rawSnackbar(
    message: message?.capitalizeFirst ?? "An error occured! 🙂",
    title: 'Oops!',
    instantInit: true,
    duration: Duration(seconds: duration),
    backgroundColor: Colors.red.withOpacity(.8),
    margin: EdgeInsets.symmetric(horizontal: 20),
    snackPosition: SnackPosition.TOP,
    borderRadius: 8,
  );
}

void showSuccessToast({String? message}) {
  Get.rawSnackbar(
    message: message?.capitalizeFirst ?? '',
    title: 'Success',
    instantInit: true,
    duration: Duration(seconds: 4),
    backgroundColor: webviewappMainColor.withOpacity(.8),
    margin: EdgeInsets.symmetric(horizontal: 20),
    snackPosition: SnackPosition.TOP,
    borderRadius: 8,
  );
}

class ParserService {
  static num parseMoneyToNum(String money) {
    return num.tryParse(money.replaceAll(',', '')) ?? 0;
  }

// static String formatToMoney(num amount,
//     {String? currency,
//     required BuildContext context,
//     compact = true,
//     bool getSymbolFromCurrency = false}) {
//   String? currencyTo = context
//       .read(authProvider)
//       .fetchUserResponse
//       .data
//       .wallet
//       ?.balance
//       ?.currency;
//   MoneyFormatter fmf = MoneyFormatter(
//       amount: amount.toDouble(),
//       settings: MoneyFormatterSettings(
//           thousandSeparator: ',', decimalSeparator: '.'));
//   return '${currencyTo ?? currency}${compact ? fmf.output.compactNonSymbol : fmf.output.nonSymbol}';
// }
}

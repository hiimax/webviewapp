import '../../../res/import/import.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScanScreenWidget(),
      ),
    );
  }
}

class ScanScreenWidget extends StatelessWidget {
  const ScanScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


import '../../res/import/import.dart';

class AppBarNavigation extends StatelessWidget {
  String title;
  String subtitle;
  Color? color;
  AppBarNavigation(
      {Key? key, required this.title, required this.subtitle, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
                SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: webviewappAppNavigationTextColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: color ?? webviewappTextColor,
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class AppBarNavigationWithoutPop extends StatelessWidget {
  String title;
  Widget? widget;
  AppBarNavigationWithoutPop({Key? key, required this.title, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: webviewappAppNavigationTextColor,
              ),
            ),
            widget ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

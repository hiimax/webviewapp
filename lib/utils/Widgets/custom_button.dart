import '../../res/import/import.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
              color: webviewappPrimaryColor,
              border: Border.all(color: webviewappPrimaryColor),
              shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              icon,
              color: webviewappWhite,
            ),
          )),
    );
  }
}

class CustomButtonWithIconRight extends StatelessWidget {
  const CustomButtonWithIconRight({
    Key? key,
    this.title,
    this.buttonColor,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.textSize,
    this.showIcon = false,
    this.icon,
    this.radius,
  }) : super(key: key);

  final String? title;
  final Color? buttonColor;
  final Color? textColor;
  final bool? showIcon;
  final double? textSize;
  final BorderRadius? radius;
  final Color? borderColor;
  final Widget? icon;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(color: webviewappPrimaryColor),
            borderRadius: radius ?? BorderRadius.circular(28)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title ?? '',
                  style: TextStyle(
                      fontFamily: "Helvetica Neue",
                      fontSize: textSize ?? 18,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
              ),
              // SizedBox(width: ,)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ?? SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    Key? key,
    this.title,
    this.buttonColor,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.textSize,
  }) : super(key: key);

  final String? title;
  final Color? buttonColor;
  final Color? textColor;
  final double? textSize;
  final Color? borderColor;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: buttonColor ?? webviewappPrimaryColor,
            border: Border.all(color: borderColor ?? webviewappPrimaryColor),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title ?? '',
                  style: TextStyle(
                      fontFamily: "Helvetica Neue",
                      fontSize: textSize ?? 16,
                      fontWeight: FontWeight.w700,
                      color: textColor ?? webviewappCustomButtonTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.onPressed,
      this.title,
      this.loadingState = false,
      this.buttonColor,
      this.textColor,
      this.buttonTextSize,
      this.buttonRadius,
      this.textSize,
      this.enabled = true})
      : super(key: key);

  final VoidCallback? onPressed;
  final double? textSize;
  final String? title;
  final bool enabled;
  final bool loadingState;
  final Color? buttonColor;
  final Color? textColor;
  final double? buttonTextSize;
  final BorderRadius? buttonRadius;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      "$title",
      textAlign: TextAlign.center,
      maxLines: 1,
      // overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: "Helvetica Neue",
          fontSize: textSize ?? 16,
          fontWeight: FontWeight.w700,
          color: textColor ?? webviewappCustomButtonTextColor),
    );
    return Container(
      width: double.infinity,
      height: 56,
      child: loadingState
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(webviewappPrimaryColor),
              ),
            )
          : TextButton(
              onPressed: enabled ? onPressed : null,
              child: textWidget,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      enabled ? buttonColor ?? webviewappPrimaryColor : webviewappGrey),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: buttonRadius ?? BorderRadius.circular(100)))),
            ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    Key? key,
    this.title,
    this.borderradius,
    this.buttonColor,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.textSize,
    this.showIcon = false,
    this.icon,
  }) : super(key: key);

  final String? title;
  final Color? buttonColor;
  final Color? textColor;
  final bool? showIcon;
  final double? textSize;
  final Color? borderColor;
  final Widget? icon;
  final double? borderradius;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: buttonColor ?? webviewappPrimaryColor,
            border: Border.all(color: borderColor ?? webviewappPrimaryColor),
            borderRadius: borderradius == null
                ? BorderRadius.circular(5)
                : BorderRadius.circular(borderradius!)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon ?? SizedBox.shrink(),
              SizedBox(
                width: 5,
              ),
              Text(
                title ?? '',
                style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontSize: textSize ?? 16,
                  fontWeight: FontWeight.w700,
                  color: textColor ?? webviewappCustomButtonTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CustomButtonWithIconRight extends StatelessWidget {
//   const CustomButtonWithIconRight({
//     Key? key,
//     this.title,
//     this.buttonColor,
//     this.textColor,
//     this.onPressed,
//     this.borderColor,
//     this.textSize,
//     this.showIcon = false,
//     this.icon,
//   }) : super(key: key);
//
//   final String? title;
//   final Color? buttonColor;
//   final Color? textColor;
//   final bool? showIcon;
//   final double? textSize;
//   final Color? borderColor;
//   final Widget? icon;
//
//   final Function()? onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56,
//       decoration: BoxDecoration(
//           color: buttonColor,
//           border: Border.all(color: borderColor ?? Zinarihelper.zeenahlightPrimary),
//           borderRadius: BorderRadius.circular(28)),
//       child: FlatButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         onPressed: onPressed,
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Flexible(
//                 child: Text(
//                   title ?? '',
//                   style: TextStyle(
//                       fontFamily: "Helvetica Neue",
//
//                       fontSize: textSize ?? 18,
//                       fontWeight: FontWeight.bold,
//                       color: textColor),
//                 ),
//               ),
//               // SizedBox(width: ,)
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     icon ?? SizedBox(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

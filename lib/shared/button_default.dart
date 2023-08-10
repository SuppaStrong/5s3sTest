import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function? press;
  final Color? backgroundColor;
  final double? textFontsize;
  final double? buttonHeight;
  final bool isIconInSameLine;
  final Icon? iconButton;

  const DefaultButton(
      {Key? key,
      required this.text,
      this.press,
      this.backgroundColor,
      this.textFontsize,
      this.buttonHeight,
      required this.isIconInSameLine,
      this.iconButton, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: buttonHeight ?? 56,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shadowColor: Colors.black,
        ),
        onPressed: press as void Function()?,
        child: isIconInSameLine
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconButton ?? const Icon(null),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: textFontsize ?? 20,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconButton ?? const Icon(null),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: textFontsize,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

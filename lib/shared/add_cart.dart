import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
  final GestureTapCallback onTap;
  final double width;
  final double height;
  final double iconHeight;
  final IconData icon;
  const AddCard({
    Key? key,
    required this.onTap,
    required this.width,
    required this.height,
    required this.icon,
    required this.iconHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: const Color.fromRGBO(207, 207, 207, 1),
        width: width,
        height: height,
        child: Align(
            alignment: Alignment.center,
            child: Icon(
              icon,
              size: iconHeight,
              color: Colors.white,
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ElevatedButtonIcon extends StatelessWidget {
  const ElevatedButtonIcon({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.bgColor,
    required this.style,
    required this.iconColor, required this.onTap,
  }) : super(key: key);
  final String text;
  final String iconPath;
  final Color bgColor;
  final TextStyle style;
  final VoidCallback onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onTap,
      label: Text(
        text,
        style: style,
      ),
      icon: SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
        color:iconColor ,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;
  final double borderWidth;
  final Color borderColor;
  final Color iconColor;
  final Color backgroundColor;
  final IconData icon;

  const CircularIconButton(
      {Key? key,
      required this.onPressed,
      this.size = 50.0,
      this.borderWidth = 3.0,
      this.borderColor = Colors.blue,
      this.iconColor = Colors.blue,
      this.backgroundColor = Colors.white,
      this.icon = Icons.arrow_forward_ios})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(size / 2),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: borderWidth),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: size * 0.5,
          ),
        ),
      ),
    );
  }
}

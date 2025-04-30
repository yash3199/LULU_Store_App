import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulu_store_app/core/utils/colors.dart';

Future<void> showCommonAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
  IconData? prefixIcon,
  Color iconColor = Colors.blue,
  String confirmText = 'OK',
  String cancelText = 'Cancel',
  bool showCancel = false,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
}) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: AppColors.backGroundColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      title: Row(
        children: [
          if (prefixIcon != null)
            Icon(prefixIcon, color: iconColor),
          if (prefixIcon != null)
            const SizedBox(width: 8),
          Expanded(child: Text(title,style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            fontFamily: GoogleFonts.notoSans().fontFamily,
          ),)),
        ],
      ),
      content: Text(message,style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),),
      actions: [
        if (showCancel)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onCancel?.call();
            },
            child: Text(cancelText),
          ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm?.call();
          },
          child: Text(confirmText),
        ),
      ],
    ),
  );
}

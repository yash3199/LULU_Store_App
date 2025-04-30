import 'package:flutter/material.dart';
import 'package:lulu_store_app/core/utils/colors.dart';
import 'package:lulu_store_app/core/utils/dimensions.dart';

class OptionButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const OptionButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(top: AppDimensions.paddingMedium),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : AppColors.homeOptionsBackgroundLight,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.blue, width: isSelected ? 2 : 1),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

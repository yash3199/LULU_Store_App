import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulu_store_app/core/utils/colors.dart';

import '../dimensions.dart';

class CommonDropdownWidget extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;
  final List<String> items;
  final Widget? prefix;

  const CommonDropdownWidget({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.prefix,
  }) : super(key: key);

  OutlineInputBorder _buildBorder({required Color color, double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      dropdownColor: Theme.of(context).primaryColor,
      icon: Icon(
        Icons.arrow_drop_down_circle,
        color: Theme.of(context).focusColor,
        size: 16,
      ),
      isExpanded: true, // Prevent horizontal overflow

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        prefix: prefix == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: prefix,
              ),
        constraints: BoxConstraints(maxWidth: double.maxFinite),
        alignLabelWithHint: true,
        enabledBorder: _buildBorder(color: Theme.of(context).dividerColor),
        disabledBorder: _buildBorder(color: Theme.of(context).dividerColor),
        focusedBorder: _buildBorder(color: Theme.of(context).dividerColor, width: 1),
        errorBorder: _buildBorder(color: AppColors.redGradientShade2),
        focusedErrorBorder: _buildBorder(color: AppColors.redGradientShade2, width: 1),
      ),
      style: TextStyle(
        color: Theme.of(context).focusColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      onChanged: onChanged,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Row(
            children: [
              Icon(Icons.circle, color: Colors.blue, size: 10),
              SizedBox(width: 0.01.sh),
              Text(
                item,
                maxLines: 2, // Allows wrapping to a second line
                overflow: TextOverflow.ellipsis, // Make sure it wraps
                softWrap: true,
                style: TextStyle(
                  fontSize: AppDimensions.fontSmall,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.notoSans().fontFamily,
                ),
              ),
            ],
          ),
        );
      }).toList(),

      /// ✅ This is what controls the height of the selected item!
      selectedItemBuilder: (BuildContext context) {
        return items.map((String item) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.circle, color: Colors.blue, size: 10),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  item,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: AppDimensions.fontSmall,
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.notoSans().fontFamily,
                  ),
                ),
              ),
            ],
          );
        }).toList();
      },
    );
  }
}

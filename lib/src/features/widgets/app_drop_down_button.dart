import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';



class AppDropDownButton extends StatefulWidget {
  const AppDropDownButton({Key? key, required this.items, required this.initial, required this.onChanged}) : super(key: key);
  final List<DropdownMenuItem> items;
  final String initial;
  final Function(dynamic) onChanged;
  @override
  State<AppDropDownButton> createState() => _AppDropDownButtonState();
}

class _AppDropDownButtonState extends State<AppDropDownButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.gray200, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(

          icon: SvgPicture.asset(
            AppAssets.svg.arrowDown,
            color: AppColors.gray400,
          ),
          focusColor: Colors.white,
          isExpanded: true,
          // hint: Text(
          //   widget.initial,
          //   style: AppStyles.s15w400.copyWith(
          //     color: AppColors.gray400,
          //   ),
          // ),
          value: widget.initial,
          items: widget.items,
          onChanged:widget.onChanged ,
        ),
      ),
    );
  }
}

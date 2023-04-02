import 'package:diploma_admin/src/features/home/data/bloc/admin_bloc.dart';
import 'package:diploma_admin/src/features/navigation/app_router/app_router.dart';
import 'package:diploma_admin/src/features/widgets/app_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import 'app_text_form_field.dart';
import 'elevated_icon.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 350,
          child: AppTextFormField(
            hintText: 'search',
            hintStyle: AppStyles.s14w500.copyWith(color: AppColors.gray400),
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: SvgPicture.asset(
                AppAssets.svg.search,
                color: AppColors.gray200,
              ),
            ),
            onChange: (String value) {
              context.read<AdminBloc>().add(SearchUsersEvent(query: value));
            },
          ),
        ),
        const SizedBox(width: 23),
        ElevatedButtonIcon(
          text: 'Filter',
          iconPath: AppAssets.svg.filter,
          bgColor: AppColors.background,
          style: AppStyles.s15w500.copyWith(color: AppColors.gray600),
          iconColor: AppColors.gray400,
          onTap: () {
            showFilterDialog(context);
          },
        ),
      ],
    );
  }
}

void showFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Text(
          'FILTER BY',
          style: AppStyles.s20w600,
        ),
        content: FilterBody(),
      );
    },
  );
}

class FilterBody extends StatefulWidget {
  const FilterBody({Key? key}) : super(key: key);

  @override
  State<FilterBody> createState() => _FilterBodyState();
}

class _FilterBodyState extends State<FilterBody> {
  String selectedValue = UserType.all.name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppDropDownButton(
          items: [
            DropdownMenuItem(
              value: UserType.all.name,
              child: const Text(
                'All',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                ),
              ),
            ),
            DropdownMenuItem(
              value: UserType.student.name,
              child: const Text(
                'student',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                ),
              ),
            ),
            DropdownMenuItem(
              value: UserType.teacher.name,
              child: const Text(
                'teacher',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                ),
              ),
            ),
          ],
          initial: selectedValue,
          onChanged: (value) {
            selectedValue = value;
            print(selectedValue);
            context
                .read<AdminBloc>()
                .add(FilterUsersEvent(filter: selectedValue));
            context.router.pop(context);
          },
        )
      ],
    );
  }
}

class DropButton extends StatelessWidget {
  const DropButton(
      {Key? key, required this.onChange, required this.initialValue})
      : super(key: key);
  final Function(String?)? onChange;
  final String initialValue;

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
          focusColor: Colors.white,
          icon: SvgPicture.asset(
            AppAssets.svg.arrowDown,
            color: AppColors.gray400,
          ),
          isExpanded: true,
          hint: Text(
            initialValue,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black45,
            ),
          ),
          value: initialValue,
          items: const [
            DropdownMenuItem(
              value: 'student',
              child: Text(
                'student',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'teacher',
              child: Text(
                'teacher',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                ),
              ),
            ),
          ],
          onChanged: onChange,
        ),
      ),
    );
  }
}

class AppFilterButton extends StatelessWidget {
  const AppFilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
        backgroundColor: const Color(0xFFF8F9FC),
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      label: Text(
        'Filter',
        style: AppStyles.s14w500.copyWith(color: AppColors.gray400),
      ),
      icon: SvgPicture.asset(
        AppAssets.svg.filter,
        width: 24,
        height: 24,
        color: AppColors.gray400,
      ),
    );
  }
}

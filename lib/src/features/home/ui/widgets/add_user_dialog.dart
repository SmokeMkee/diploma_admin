import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../widgets/app_text_form_field.dart';
import '../../data/bloc/admin_bloc.dart';

void showAlertDialogAddStudent(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      titleTextStyle: AppStyles.s20w600,
      titlePadding: const EdgeInsets.symmetric(vertical: 29, horizontal: 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Add new user'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width / 3.5,
        child: const CreateStudentBody(),
      ),
    ),
  );
}

class CreateStudentBody extends StatefulWidget {
  const CreateStudentBody({Key? key}) : super(key: key);

  @override
  State<CreateStudentBody> createState() => _CreateStudentBodyState();
}

class _CreateStudentBodyState extends State<CreateStudentBody> {
  TextEditingController name = TextEditingController();
  TextEditingController secondName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String selectedValue = 'teacher';

  @override
  void dispose() {
    name.dispose();
    secondName.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextFormField(
          hintText: 'First name',
          textEditingController: name,
        ),
        const SizedBox(height: 28),
        AppTextFormField(
          hintText: 'Second name',
          textEditingController: secondName,
        ),
        const SizedBox(height: 28),
        AppTextFormField(
          hintText: 'Email address',
          textEditingController: email,
        ),
        const SizedBox(height: 28),
        AppTextFormField(
          hintText: 'Password',
          textEditingController: password,
        ),
        const SizedBox(height: 28),
        DropButton(
          onChange: (val) {
            setState(() {});
            selectedValue = val ?? 'student';
          },
          initialValue: selectedValue,
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            context.read<AdminBloc>().add(
                  CreateUsersEvent(
                    email: email.text,
                    firstName: name.text,
                    secondName: secondName.text,
                    password: password.text,
                    userType: selectedValue,
                  ),
                );
            context.router.pop();
          },
          child: const Text('Create'),
        )
      ],
    );
  }
}

class DropButton extends StatefulWidget {
  const DropButton(
      {Key? key, required this.onChange, required this.initialValue})
      : super(key: key);
  final Function(String?)? onChange;
  final String initialValue;

  @override
  State<DropButton> createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
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
            widget.initialValue,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black45,
            ),
          ),
          value: widget.initialValue,
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
          onChanged: widget.onChange,
        ),
      ),
    );
  }
}

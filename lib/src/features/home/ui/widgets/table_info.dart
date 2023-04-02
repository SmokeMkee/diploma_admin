import 'package:diploma_admin/src/features/navigation/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../user_detail/data/bloc/profile_bloc.dart';
import '../../../widgets/app_check_box.dart';
import '../../data/bloc/admin_bloc.dart';
import '../../data/dto/list_users.dart';

class TableBody extends StatefulWidget {
  const TableBody({Key? key, required this.data}) : super(key: key);
  final List<User> data;

  @override
  State<TableBody> createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  bool checkAll = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          width: 1,
          color: AppColors.gray200,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Table(
            border: const TableBorder(
              horizontalInside: BorderSide(
                width: 1,
                color: AppColors.gray200,
                style: BorderStyle.solid,
              ),
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(3),
              4: FlexColumnWidth(1),
              5: FlexColumnWidth(1),
              6: FlexColumnWidth(2),
            },
            children: [
              TableRow(
                children: [
                  AppCheckbox(
                    onChanged: (value) {
                      if (checkAll == true) {
                        setState(() {
                          checkAll = value ?? false;
                        });
                      } else {
                        setState(() {
                          checkAll = value ?? false;
                        });
                      }
                    },
                  ),
                  const HeaderTableText(text: 'Surname'),
                  const HeaderTableText(text: 'First name'),
                  const HeaderTableText(text: 'Email'),
                  const HeaderTableText(text: 'Student'),
                  const HeaderTableText(text: 'Teacher'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<AdminBloc>().add(DeleteUsersEvent());
                        // ..add(FetchAllUsersEvent());
                      },
                      child: Text(
                        'Delete selected',
                        style:
                            AppStyles.s15w500.copyWith(color: AppColors.white),
                      ),
                    ),
                  )
                ],
              ),
              ...widget.data.map(
                (e) {
                  return TableRow(
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: AppCheckbox(
                          initial: checkAll,
                          onChanged: (value) {
                            e.check = value ?? false;
                            value != value;
                          },
                        ),
                      ),
                      TableCell(
                        child: BodyTableText(
                            text: e.userprofile?.surname ?? 'No info'),
                      ),
                      TableCell(
                        child: BodyTableText(
                            text: e.userprofile?.name ?? 'No info'),
                      ),
                      TableCell(
                        child: BodyTableText(text: e.email ?? 'No info'),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: AppCheckbox(

                          initial: e.userType?.toLowerCase() == 'student',
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: AppCheckbox(

                         
                          initial: e.userType == 'teacher',
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: GestureDetector(
                          child: SvgPicture.asset(AppAssets.svg.arrowRight2),
                          onTap: () {
                            context
                                .read<ProfileBloc>()
                                .add(FetchInfoProfile(id: e.id ?? 0));

                            context.router.push(
                              UserDetailScreenRoute(
                                idUser: e.id ?? 0,
                                fullName:
                                    '${e.userprofile?.name} ${e.userprofile?.surname}',
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderTableText extends StatelessWidget {
  const HeaderTableText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(42, 13, 0, 13),
      child: Text(
        text,
        style: AppStyles.s15w500.copyWith(color: AppColors.gray600),
      ),
    );
  }
}

class BodyTableText extends StatelessWidget {
  const BodyTableText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(42, 13, 22, 13),
      child: Text(
        text,
        style: AppStyles.s15w500,
      ),
    );
  }
}

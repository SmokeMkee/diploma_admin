import 'package:diploma_admin/constants/app_assets.dart';
import 'package:diploma_admin/constants/app_colors.dart';
import 'package:diploma_admin/constants/app_styles.dart';
import 'package:diploma_admin/src/features/home/ui/widgets/add_user_dialog.dart';
import 'package:diploma_admin/src/features/home/ui/widgets/table_info.dart';
import 'package:diploma_admin/src/features/widgets/elevated_icon.dart';
import 'package:diploma_admin/src/features/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/bloc/admin_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
        child: BlocBuilder<AdminBloc, AdminState>(
          builder: (context, state) {
            if (state is AdminLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AdminData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const Text('all users'),
                    const SizedBox(height: 51),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SearchWidget(),
                        ElevatedButtonIcon(
                          text: 'Add new user',
                          iconPath: AppAssets.svg.add,
                          bgColor: AppColors.accent,
                          style: AppStyles.s15w500
                              .copyWith(color: AppColors.white),
                          iconColor: AppColors.white,
                          onTap: () {
                            showAlertDialogAddStudent(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    TableBody(data: state.listUsers),
                  ],
                ),
              );
            }
            if (state is AdminError) {
              return Center(
                child: Text(state.error),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

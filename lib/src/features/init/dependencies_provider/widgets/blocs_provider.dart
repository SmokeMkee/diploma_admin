import 'package:diploma_admin/src/features/api/api.dart';
import 'package:diploma_admin/src/features/home/data/repo/repo_admin.dart';
import 'package:diploma_admin/src/features/user_detail/data/bloc/profile_bloc.dart';
import 'package:diploma_admin/src/features/user_detail/data/repo/repo_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../auth/data/auth_bloc.dart';
import '../../../home/data/bloc/admin_bloc.dart';

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider(
          create: (context) => AuthBloc(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => AdminBloc(
            repo: RepositoryProvider.of<RepoAdmin>(context),
          )..add(FetchAllUsersEvent()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            repo: RepositoryProvider.of<RepoProfile>(context),
          ),
        ),
      ],
      child: child,
    );
  }
}

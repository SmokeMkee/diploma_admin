import 'package:diploma_admin/src/features/user_detail/data/repo/repo_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../api/api.dart';
import '../../../auth/repo/repo_auth.dart';
import '../../../home/data/repo/repo_admin.dart';


class ReposProvider extends StatelessWidget {
  const ReposProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Api(),
        ),
        Provider(
          create: (context) => RepoAuth(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoProfile(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoAdmin(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),


      ],
      child: child,
    );
  }
}

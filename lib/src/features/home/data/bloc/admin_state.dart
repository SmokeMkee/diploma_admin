part of 'admin_bloc.dart';

abstract class AdminState {}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {}

class AdminData extends AdminState {
  AdminData({
    required this.listUsers,
  });

  final List<User> listUsers;
}

class AdminError extends AdminState {
  AdminError({
    required this.error,
  });

  final String error;
}

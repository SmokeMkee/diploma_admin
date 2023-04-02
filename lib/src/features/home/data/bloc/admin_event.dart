part of 'admin_bloc.dart';

abstract class AdminEvent {}

class FetchAllUsersEvent extends AdminEvent {}

class DeleteUsersEvent extends AdminEvent {}

class CreateUsersEvent extends AdminEvent {
  CreateUsersEvent({
    required this.email,
    required this.firstName,
    required this.secondName,
    required this.password,
    required this.userType,
  });

  final String firstName;
  final String secondName;
  final String email;
  final String password;
  final String userType;
}

class SearchUsersEvent extends AdminEvent {
  final String query;

  SearchUsersEvent({required this.query});
}

class FilterUsersEvent extends AdminEvent {
  final String filter;

  FilterUsersEvent({required this.filter});
}

enum UserType { teacher, student, all }

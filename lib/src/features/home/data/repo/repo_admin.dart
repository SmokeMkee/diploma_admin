import 'dart:convert';

import '../../../api/api.dart';
import '../../../widgets/app_error_dialog.dart';
import '../dto/list_users.dart';

class RepoAdmin {
  RepoAdmin({required this.api});

  final Api api;

  Future<List<User>> fetch() async {
    final result = await api.dio.get(
      '/admin/get-all-user',
    );
    List<User> listUsers = usersListFromJson(json.encode(result.data));

    return listUsers;
  }

  Future<void> deleteUser(List<int> list) async {
     await api.dio.post('/admin/delete-user', data: {
      "ids": list,
    });
  }

  Future<Message> createUser(
    String firstName,
    String secondName,
    String email,
    String password,
    String userType,
  ) async {
    final result = await api.dio.post(
      '/admin/register-new-user',
      data: {
        "email": email,
        "password": password,
        "username": firstName,
        "surname": secondName,
        "userTyoe": userType,
      },
    );
    return Message.fromMap(result.data);
  }
}

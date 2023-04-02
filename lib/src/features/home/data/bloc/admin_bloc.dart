import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:diploma_admin/src/features/home/data/repo/repo_admin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dto/list_users.dart';

part 'admin_event.dart';

part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc({required this.repo}) : super(AdminInitial()) {
    on<FetchAllUsersEvent>(fetchData, transformer: droppable());
    on<DeleteUsersEvent>(deleteUsers, transformer: droppable());
    on<SearchUsersEvent>(searchData, transformer: droppable());
    on<CreateUsersEvent>(createUser, transformer: droppable());
    on<FilterUsersEvent>(filterData, transformer: droppable());
  }

  List<User> listUsers = [];

  Future<void> createUser(
    CreateUsersEvent event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(AdminLoading());
      await repo.createUser(
        event.firstName,
        event.secondName,
        event.email,
        event.password,
        event.userType,
      );
      emit(
        AdminData(listUsers: listUsers),
      );
    } catch (e) {
      emit(AdminError(error: 'error message'));
    }
  }

  Future<void> fetchData(
    FetchAllUsersEvent event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(AdminLoading());
      final response = await repo.fetch();
      listUsers.addAll(response);
      emit(
        AdminData(
          listUsers: response,
        ),
      );
    } catch (e) {
      emit(AdminError(error: 'error message'));
    }
  }

  Future<void> filterData(
    FilterUsersEvent event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(AdminLoading());
      if (event.filter.isEmpty || event.filter == 'all') {
        emit(AdminData(listUsers: listUsers));
      } else {
        var list = listUsers
            .where((element) =>
                element.userType?.toLowerCase() == event.filter.toLowerCase())
            .toList();

        emit(AdminData(listUsers: list));
      }
    } catch (e) {
      emit(AdminError(error: 'error message'));
    }
  }

  Future<void> searchData(
    SearchUsersEvent event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(AdminLoading());
      if (event.query.isEmpty) {
        emit(AdminData(listUsers: listUsers));
      } else {
        var list = listUsers
            .where((element) => element.email!.contains(event.query))
            .toList();

        emit(AdminData(listUsers: list));
      }
    } catch (e) {
      emit(AdminError(error: 'error message'));
    }
  }

  Future<void> deleteUsers(
    DeleteUsersEvent event,
    Emitter<AdminState> emit,
  ) async {
    try {
      List<int> list = [];
      for (int i = 0; i < listUsers.length; i++) {
        if (listUsers[i].check == true) {
          list.add(listUsers[i].id!);
        }
      }
      emit(AdminLoading());
      await repo.deleteUser(list);
      emit(AdminData(listUsers: listUsers));
    } catch (e) {
      emit(AdminError(error: 'error message'));
    }
  }

  final RepoAdmin repo;
}

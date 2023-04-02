part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class FetchInfoProfile extends ProfileEvent {
  FetchInfoProfile({required this.id});

  final int id;
}

class UpdateInfoProfile extends ProfileEvent {
  UpdateInfoProfile({required this.profile});

  final Profile profile;
}

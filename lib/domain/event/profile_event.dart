import 'package:equatable/equatable.dart';

sealed class ProfileEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class ExitProfileEvent extends ProfileEvent {}

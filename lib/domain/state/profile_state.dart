import 'package:equatable/equatable.dart';

sealed class ProfileState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class ProfileStateInitial extends ProfileState {}

class ProfileStateLoading extends ProfileState {}

class ProfileStateFail extends ProfileState {
  ProfileStateFail(this.errorText);

  final String errorText;

  @override
  List<Object> get props => [errorText];
}

class ProfileStateSuccess extends ProfileState {}

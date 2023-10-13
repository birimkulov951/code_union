import 'package:code_union/domain/entities/auth_data.dart';
import 'package:equatable/equatable.dart';

sealed class AuthState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class AuthStateInitial extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateFail extends AuthState {
  AuthStateFail(this.errorText);

  final String errorText;

  @override
  List<Object> get props => [errorText];

}

class AuthStateSuccess extends AuthState {
  AuthStateSuccess(this.authData);

  final AuthData authData;

  @override
  List<Object> get props => [authData];
}

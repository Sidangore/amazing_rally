part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email, password;
  AuthLoginRequested(this.email, this.password);
  @override
  List<Object?> get props => [email, password];
}

class AuthRegisterRequested extends AuthEvent {
  final String email, password;
  AuthRegisterRequested(this.email, this.password);
  @override
  List<Object?> get props => [email, password];
}

class AuthLoggedOut extends AuthEvent {}

part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
   @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {}


class AuthLoading extends AuthState {}

class AuthOtpSent extends AuthState {
  final String verificationId;
  AuthOtpSent({required this.verificationId});
}

class AuthVerified extends AuthState {
  final User user;
  AuthVerified(this.user);

  @override
  List<Object?> get props => [user.uid];
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthSignedOut extends AuthState {}
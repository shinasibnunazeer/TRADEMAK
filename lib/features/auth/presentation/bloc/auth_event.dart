part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent  extends Equatable{}



class SendOtpEvent extends AuthEvent {
  final String phoneNumber;
  final Function() onCodeSent;

  SendOtpEvent({required this.phoneNumber, required this.onCodeSent});

  @override
  List<Object?> get props => [phoneNumber];
}

class VerifyOtpEvent extends AuthEvent {
  final String smsCode;
  final String verificationId;
  
  VerifyOtpEvent({required this.smsCode,  required this.verificationId,});

  @override
  List<Object?> get props => [smsCode];
}

class SignOutEvent extends AuthEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
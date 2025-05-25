

// features/auth/domain/usecases/verify_otp_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tagmak/core/error/failures.dart';
import 'package:tagmak/features/auth/domain/repo/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Either<Failure, UserCredential>> call({
    required String smsCode,
     required String verificationId,
  }) {
    return repository.verifyOtp(smsCode: smsCode, verificationId: verificationId);
  }
}

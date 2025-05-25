


// features/auth/domain/repositories/auth_repository.dart
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tagmak/core/error/failures.dart';


abstract class AuthRepository {
  Future<Either<Failure, String>> sendOtp({
    required String phoneNumber,
    required Function() onCodeSent,
  });

  Future<Either<Failure, UserCredential>> verifyOtp({
    required String smsCode,
     required String verificationId,
  });

  Future<void> signOut();
}

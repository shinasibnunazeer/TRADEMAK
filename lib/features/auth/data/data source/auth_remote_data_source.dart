// features/auth/data/datasources/auth_remote_data_source.dart
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tagmak/core/error/failures.dart';



abstract interface class AuthRemoteDataSource {
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


// features/auth/data/repositories/auth_repository_impl.dart
// features/auth/data/repositories/auth_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tagmak/core/error/failures.dart';
import 'package:tagmak/features/auth/data/data%20source/auth_remote_data_source.dart';
import 'package:tagmak/features/auth/domain/repo/auth_repository.dart';



class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> sendOtp({
    required String phoneNumber,
    required Function() onCodeSent,
  }) {
    return remoteDataSource.sendOtp(
      phoneNumber: phoneNumber,
      onCodeSent: onCodeSent,
    );
  }

  @override
  Future<Either<Failure, UserCredential>> verifyOtp({
    required String smsCode,
     required String verificationId,
  }) {
    return remoteDataSource.verifyOtp(smsCode: smsCode,  verificationId: verificationId);
  }

  @override
  Future<void> signOut() {
    return remoteDataSource.signOut();
  }
}


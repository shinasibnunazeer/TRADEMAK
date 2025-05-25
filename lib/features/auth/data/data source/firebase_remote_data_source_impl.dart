// features/auth/data/datasources/auth_remote_data_source_impl.dart
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:tagmak/core/error/failures.dart';
import 'auth_remote_data_source.dart';

class FireabseRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;


  FireabseRemoteDataSourceImpl(this._auth);

  @override
  Future<Either<Failure, String>> sendOtp({
    required String phoneNumber,
    required Function() onCodeSent,
  }) async {
    print('sendOtp called with phoneNumber: $phoneNumber');
    final completer = Completer<String?>();

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (_) {},
        verificationFailed: (error) {
          // Complete the future with an error that will be caught below
          completer.completeError(error);
        },
        codeSent: (verificationId, _) {
          print('Code sent: $verificationId');
          completer.complete(verificationId);
        },
        codeAutoRetrievalTimeout: (_) {
          completer.completeError(TimeoutException('SMS code timeout'));
        },
      );

      final verificationId = await completer.future;

      return verificationId != null
          ? Right(verificationId)
          : Left(UnknownFailure(message: 'Unknown error'));
    } on FirebaseAuthException catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    } on TimeoutException {
      return Left(UnknownFailure(message: 'Timeout error'));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> verifyOtp({
    required String smsCode,
    required String verificationId,
  }) async {
    try {

      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      final result = await _auth.signInWithCredential(credential);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure(message: e.message ?? 'Invalid code'));
    } catch (e) {
      return Left(UnknownFailure(message: 'Unknown error: ${e.toString()}'));
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

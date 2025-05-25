

// features/auth/domain/usecases/send_otp_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:tagmak/core/error/failures.dart';
import 'package:tagmak/features/auth/domain/repo/auth_repository.dart';


class SendOtpUseCase {
  final AuthRepository repository;

  SendOtpUseCase(this.repository);

  Future<Either<Failure, String>> call({
    required String phoneNumber,
    required Function() onCodeSent,
  }) {
    return repository.sendOtp(
      phoneNumber: phoneNumber,
      onCodeSent: onCodeSent,
    );
  }
}

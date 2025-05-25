

// features/auth/domain/usecases/sign_out_usecase.dart
import 'package:tagmak/features/auth/domain/repo/auth_repository.dart';


class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<void> call() {
    return repository.signOut();
  }
}
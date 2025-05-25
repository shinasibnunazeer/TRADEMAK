import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:tagmak/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:tagmak/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:tagmak/features/auth/domain/usecases/verify_otp_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

// features/auth/presentation/bloc/auth_bloc.dart

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final SignOutUseCase signOutUseCase;

  AuthBloc({
    required this.sendOtpUseCase,
    required this.verifyOtpUseCase,
    required this.signOutUseCase,
  }) : super(AuthInitial()) {
    on<SendOtpEvent>(_onSendOtp);
    on<VerifyOtpEvent>(_onVerifyOtp);
    on<SignOutEvent>(_onSignOut);
  }

  Future<void> _onSendOtp(SendOtpEvent event, Emitter<AuthState> emit) async {
    final phone = event.phoneNumber.trim();
    emit(AuthLoading());
    if (phone.isEmpty) {
      emit(AuthError('Please enter a valid phone number.'));
      return;
    }

    final result = await sendOtpUseCase(
      phoneNumber: event.phoneNumber,
      onCodeSent: event.onCodeSent,
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (successValue) => emit(AuthOtpSent(verificationId: successValue)),
    );
  }

  Future<void> _onVerifyOtp(
    VerifyOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    //sms code is null
    if (event.smsCode.isEmpty) {
      emit(AuthError('Please enter a valid code.'));
      return;
    }
    //if less than 6 digits
    if (event.smsCode.length < 6) {
      emit(AuthError('Please enter a valid code.'));
      return;
    }

    final result = await verifyOtpUseCase(
      smsCode: event.smsCode,
      verificationId: event.verificationId,
    );
    result.fold((failure) => emit(AuthError(failure.message)), (
      userCredential,
    ) {
      final user = userCredential.user;
      if (user != null) {
        emit(AuthVerified(user));
      } else {
        emit(AuthError('User is null after verification.'));
      }
    });
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    await signOutUseCase();
    emit(AuthSignedOut());
  }
}

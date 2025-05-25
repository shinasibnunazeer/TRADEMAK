import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tagmak/core/constants/app_sizes.dart';
import 'package:tagmak/core/constants/svg_strings.dart';
import 'package:tagmak/core/routing/navigation_services.dart';
import 'package:tagmak/core/theme/colors.dart';
import 'package:tagmak/core/util/device_utils.dart';
import 'package:tagmak/core/widgets/common_button.dart';
import 'package:tagmak/core/widgets/snack%20bar/common_snack_bar.dart';
import 'package:tagmak/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tagmak/features/auth/presentation/widgets/otp_input_filed.dart';
import 'package:tagmak/injection.dart';
import 'package:tagmak/navigation/app_nav_bar.dart';
import 'package:tagmak/navigation/bottom_navigation_menu.dart';

class ScreenEnterOtp extends StatefulWidget {
  const ScreenEnterOtp({super.key, required this.verificationId});
  final String verificationId;
  @override
  State<ScreenEnterOtp> createState() => _ScreenEnterOtpState();
}

class _ScreenEnterOtpState extends State<ScreenEnterOtp> {
  String otp = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          DeviceUtils.hapticFeedback();
          showCustomSnackBar(context, state.message, isError: true);
        } else if (state is AuthVerified) {
          //go to home
          DeviceUtils.hapticFeedback();
          getIt<NavigationService>().go(
            screen: const AppNavbar(isAdmin: false),
          );

          // Navigate or do something after successful login
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(AppSizes.pagePadding),
            child: Column(
              children: [
                Spacer(),
                Flexible(child: SvgPicture.string(SvgStrings.phoneIcon2)),
                SizedBox(height: 60.rt),
                Text(
                  'Enter the verification code sent to',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16.rt,

                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '+44 ******',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 15.rt,

                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      TextSpan(
                        text: 'Wrong number?',
                        style: TextStyle(
                          color: const Color(0xFF979797),
                          fontSize: 15.rt,

                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.rt),
                OtpInputField(
                  length: 6,
                  onChanged: (value) {
                    otp = value;
                  },
                  onCompleted: (value) {
                    otp = value;
                  },
                ),
                SizedBox(height: 20.rt),
                Text(
                  'we sent a 6-digit code to +44 ********',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10.rt,

                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.rt),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don’t received OTP?',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 10.rt,

                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: ' Resend OTP',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 10.rt,

                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CommonButton(
                  isLoading: state is AuthLoading,
                  label: "Verify OTP",
                  onPressed: () {
                    _verifyOtp();
                  },
                ),
                SizedBox(height: DeviceUtils.bottomNavigationBarHeight()),
              ],
            ),
          ),
        );
      },
    );
  }

  void _verifyOtp() {
    context.read<AuthBloc>().add(
      VerifyOtpEvent(smsCode: otp, verificationId: widget.verificationId),
    );
  }
}

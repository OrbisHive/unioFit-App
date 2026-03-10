import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/heights_widths.dart';
import '../../../../core/resources/app_validator.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/ZBotToast.dart';
import '../../../../core/utils/app_button.dart';
import '../../../../core/utils/back_button_widget.dart';
import '../../../../core/utils/safe_area_widget.dart';

/// Screen for OTP verification.
class OtpVerificationScreen extends StatefulWidget {
  static String route = '/otp-verification';
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController otpTC = TextEditingController();
  final FocusNode otpFN = FocusNode();
  final GlobalKey<FormState> _formOTPKey = GlobalKey<FormState>();
  DateTime? _lastToastTime;

  Timer? _timer;
  int remainingTime = 300;

  String? userEmail;

  bool isFromSignUp = false;
  bool isFromMore = false;

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      isFromSignUp = Get.arguments['isFromSignUp'] ?? false;
      isFromMore = Get.arguments['isFromMore'] ?? false;
      userEmail = Get.arguments['userEmail'];
    }
    setState(() {});
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpTC.dispose();
    otpFN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeAreaWidget(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Background Image (Top Only)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 60.h,
            child: Image.asset(R.appImages.loginBg, fit: BoxFit.cover),
          ),

          // Back Button
          Positioned(top: 6.h, left: 4.w, child: BackButtonWidget()),

          // OTP Form Container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 50.h,
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
                vertical: 4.h,
              ),
              decoration: R.appDecorations.authSheetDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'otp_verification'.L(),
                      style: R.textStyles.playfairDisplay(
                        fontSize: 24.px,
                        fontWeight: FontWeight.w800,
                        color: R.appColors.textPrimary,
                      ),
                    ),
                    h1,
                    Text(
                      'enter_verification_code'.L(),
                      style: R.textStyles.poppins(
                        fontSize: 13.px,
                        fontWeight: FontWeight.w400,
                        color: R.appColors.textPrimary,
                      ),
                    ),
                    h2,
                    _otpForm(),
                    if (remainingTime != 0)
                      Padding(
                        padding: EdgeInsets.only(right: 3.w),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            _formatTime(remainingTime),
                            style: R.textStyles
                                .poppins(
                              fontSize: 12.px,
                              fontWeight: FontWeight.w400,
                              color: R.appColors.textPrimary,
                            )
                                .copyWith(
                              fontFeatures: const [
                                FontFeature.tabularFigures(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    h2,
                    AppButton(
                      backgroundColor: Colors.transparent,
                      textColor: colorScheme.brightness == Brightness.dark
                          ? R.appColors.primary
                          : R.appColors.white,
                      onPressed: () => _onVerifyOTP(),
                      title: 'verify',
                    ),
                    h4,
                    if (remainingTime == 0)
                      _bottomResendCodeText(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _otpForm() {
    return Form(
      key: _formOTPKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: PinCodeTextField(
          backgroundColor: R.appColors.transparent,
          appContext: context,
          controller: otpTC,
          focusNode: otpFN,
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          animationDuration: const Duration(milliseconds: 300),
          hintCharacter: "",
          autoDisposeControllers: false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          showCursor: true,
          cursorColor: R.appColors.greyColor,
          cursorHeight: 20,
          enableActiveFill: true,
          validator: AppValidator.validateOTP,
          onCompleted: (v) {
            log("OTP completed: $v");
          },
          textStyle: R.textStyles.poppins(
            fontSize: 20.px,
            fontWeight: FontWeight.w600,
            color: R.appColors.textPrimary,
          ),
          hintStyle: R.textStyles.poppins(
            fontSize: 12.px,
            fontWeight: FontWeight.w400,
            color: R.appColors.greyColor,
          ),
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(6),
            fieldHeight: 40,
            fieldWidth: 40,
            selectedColor: R.appColors.pinFieldActiveBorderColor,
            selectedFillColor: R.appColors.white,
            activeColor: R.appColors.pinFieldActiveBorderColor,
            activeFillColor: R.appColors.white,
            inactiveColor: R.appColors.borderColor,
            inactiveFillColor: R.appColors.pinFieldBGColor,
            errorBorderColor: R.appColors.red,
          ),
        ),
      ),
    );
  }

  Widget _bottomResendCodeText(

      ) {
    return Center(
      child: GestureDetector(
        onTap: () => _onResendCode(),
        child: RichText(
          text: TextSpan(
            style: R.textStyles.poppins(
              fontSize: 15.px,
              fontWeight: FontWeight.w500,
              color: R.appColors.darkTextSecondary,
            ),
            children: [
              TextSpan(text: "resend_code".L()),
              TextSpan(
                text: " ", // add space
              ),
              TextSpan(
                text: "resend".L(),
                style: R.textStyles
                    .poppins(
                  fontSize: 15.px,
                  fontWeight: FontWeight.w500,
                  color: R.appColors.buttonColorDark,
                )
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (remainingTime > 0) {
        remainingTime--;
      } else {
        _timer?.cancel();
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {});
      });
    });
  }

  Future<void> _onVerifyOTP() async {
    FocusScope.of(context).unfocus();

    if (_formOTPKey.currentState?.validate() ?? false) {
    }
  }

  void _showToast(String message) {
    final now = DateTime.now();
    if (_lastToastTime == null ||
        now.difference(_lastToastTime!).inSeconds > 2) {
      ZBotToast.showMessage(message: message);
      _lastToastTime = now;
    }
  }

  Future<void> _onResendCode() async {
    // if (_timer!.isActive == false) {
    //   Map body = {"email": userEmail};
    //   if (check) {
    //     debugPrint('Clicked _onResendCode');
    //     remainingTime = 300;
    //     startTimer();
    //   }
    // }
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    final formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return "0$minutes:$formattedSeconds ${"min".L()}";
  }
}

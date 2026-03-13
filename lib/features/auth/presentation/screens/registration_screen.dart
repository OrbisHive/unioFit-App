import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sizer/sizer.dart';
import 'package:unio_fit/core/resources/app_validator.dart';
import 'package:unio_fit/features/auth/presentation/screens/terms_and_privacy_view.dart';
import '../../../../core/constants/heights_widths.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/app_button.dart';
import 'otp_verification_screen.dart';
class RegistrationScreen extends StatefulWidget {
  static String route = '/registration';
  final String? preFilledPhoneNumber;
  const RegistrationScreen({super.key, this.preFilledPhoneNumber});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'PK');
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              R.appImages.login,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.55),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "registration".L(),
                        style: R.textStyles.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      h2,
                      Text(
                        "Enter your full name and phone number to create your profile",
                        style: R.textStyles.poppins(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      h5,
                      fullNameEditText(colorScheme),
                      h3,
                      phoneNumber(colorScheme),
                      h3,
                      _agreeTermsCheckbox(),
                      h4,
                      AppButton(
                        onPressed: _validateAndContinue,
                        title: "continue_button",
                        textColor: Colors.black,
                        backgroundColor: Colors.white,
                        textSize: 16,
                        textWeight: FontWeight.w600,
                        height: 50,
                        radius: 12,
                      ),
                      h3,
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget fullNameEditText(ColorScheme colorScheme) {
    return TextFormField(
      controller: _nameController,
      decoration: R.appDecorations.inputDecorationWithHint(
        hintText: "Full Name",
        hintTextStyle: R.textStyles.poppins(
            fontSize: 14.sp, color: R.appColors.greyColor),
        isLocalized: false,
      ),
      style: R.textStyles.poppins(
        color: R.appColors.primary,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(60),
        FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s'-]")),
      ],
      textCapitalization: TextCapitalization.words,
      validator: (value) => AppValidator.validateFullName(value),
      onChanged: (value) {
        if (_formKey.currentState?.validate() ?? false) {
          _formKey.currentState?.validate();
        }
      },
    );
  }

  Widget phoneNumber(ColorScheme colorScheme) {
    return InternationalPhoneNumberInput(
      spaceBetweenSelectorAndTextField: 5,
      cursorColor: R.appColors.primary,
      countries: ['PK'],
      keyboardAction: TextInputAction.next,
      inputDecoration: R.appDecorations
          .inputDecorationWithHint(
        hintText: "Phone Number",
        isLocalized: false,
        hintTextStyle: R.textStyles.poppins(
            fontSize: 14.sp, color: R.appColors.greyColor),
      )
          .copyWith(
        prefixIconConstraints:
        const BoxConstraints(maxWidth: 85, minWidth: 85),
      ),
      selectorTextStyle: R.textStyles.poppins(
        color: R.appColors.primary,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      textStyle: R.textStyles.poppins(
        fontWeight: FontWeight.w400,
        color: R.appColors.primary,
        fontSize: 13.sp,
      ),
      onInputChanged: (PhoneNumber pNumber) {
        if ((pNumber.phoneNumber?.length ?? 0) < 1) {
          setState(() {});
        }
        _phoneNumber = pNumber;
      },
      selectorConfig: const SelectorConfig(
        leadingPadding: 12,
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        showFlags: true,
        useEmoji: true,
        setSelectorButtonAsPrefixIcon: true,
        trailingSpace: false,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      initialValue: _phoneNumber,
      textFieldController: _phoneController,
      keyboardType:
      const TextInputType.numberWithOptions(signed: false, decimal: false),
      inputBorder: const OutlineInputBorder(),
      onSaved: (PhoneNumber number) => setState(() {}),
      onFieldSubmitted: (s) => setState(() {}),
    );
  }

  Widget _agreeTermsCheckbox() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          splashColor: R.appColors.transparent,
          overlayColor: WidgetStateProperty.all(R.appColors.transparent),
          onTap: () => setState(() => _isAgreed = !_isAgreed),
          child: Container(
            height: 18,
            width: 18,
            margin: const EdgeInsets.only(right: 8, top: 3),
            decoration: BoxDecoration(
              color: R.appColors.lightGreyCheckBGColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: _isAgreed
                ? Icon(Icons.check, size: 16, color: R.appColors.primary)
                : null,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: RichText(
              text: TextSpan(
                style: R.textStyles.poppins(
                  fontSize: 12.px,
                  color: R.appColors.white,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(text: "agree_to".L()),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = _onTapTermsService,
                    text: "terms_and_condition".L(),
                    style: R.textStyles.poppins(
                      fontSize: 12.px,
                      color: R.appColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(text: "and".L()),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = _onTapPrivacyPolicy,
                    text: "privacy_policy".L(),
                    style: R.textStyles.poppins(
                      fontSize: 12.px,
                      color: R.appColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _validateAndContinue() {
    if (!_formKey.currentState!.validate()) return;
    if (!_isAgreed) {
      Get.snackbar("Error", "Please accept terms and conditions");
      return;
    }
    Get.toNamed(OtpVerificationScreen.route);
  }

  void _onTapTermsService() {
    Get.toNamed(TermsAndPolicyView.route,
        arguments: {"title": 'terms_and_condition'});
  }

  void _onTapPrivacyPolicy() {
    Get.toNamed(TermsAndPolicyView.route,
        arguments: {"title": 'privacy_policy'});
  }
}
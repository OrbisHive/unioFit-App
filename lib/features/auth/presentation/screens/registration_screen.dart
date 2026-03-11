import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:unio_fit/core/resources/app_validator.dart';
import 'package:unio_fit/core/utils/safe_area_widget.dart';
import 'package:unio_fit/features/auth/presentation/screens/terms_and_privacy_view.dart';
import '../../../../core/constants/heights_widths.dart';
import '../../../../core/resources/localization/localization_map.dart';
import '../../../../core/resources/resources.dart';

import '../../../../core/utils/app_button.dart';
import 'otp_verification_screen.dart';
import 'package:sizer/sizer.dart';

/// Registration screen for entering full name and phone number.
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
  FocusNode fullNameFN = FocusNode();
  FocusNode phoneFN = FocusNode();

  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'PK');
  String? _phoneError;
  bool _isPhoneInitialized = false;
  bool _isAgreed = false;


  @override
  void initState() {
    super.initState();
    // Initialize phone number properly
    _initializePhoneNumber();
  }

  Future<void> _initializePhoneNumber() async {
    if (widget.preFilledPhoneNumber != null &&
        widget.preFilledPhoneNumber!.isNotEmpty) {
      try {
        // Parse the pre-filled phone number, but force PK country
        final parsed = await PhoneNumber.getRegionInfoFromPhoneNumber(
          widget.preFilledPhoneNumber!,
        );
        setState(() {
          _phoneNumber = PhoneNumber(
            isoCode: 'PK',
            dialCode: parsed.dialCode ?? '+92',
            phoneNumber: parsed.phoneNumber,
          );
          _phoneController.text = widget.preFilledPhoneNumber!;
          _isPhoneInitialized = true;
        });
      } catch (e) {
        // If parsing fails, initialize with Pakistan
        setState(() {
          _phoneNumber = PhoneNumber(isoCode: 'PK');
          _isPhoneInitialized = true;
        });
      }
    } else {
      // Initialize with Pakistan country code
      setState(() {
        _phoneNumber = PhoneNumber(isoCode: 'PK');
        _isPhoneInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _validateAndContinue() async {
    if (_formKey.currentState!.validate()) {
      // Validate name field
      // if (mounted) {
      Get.toNamed(OtpVerificationScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeAreaWidget(
      bottom: true,
      backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w,),
          child: AppButton(
            onPressed: _validateAndContinue,
            title: "continue_button",
            textColor: colorScheme.brightness == Brightness.dark
                ? R.appColors.primary
                : R.appColors.white,
            textSize: 16,
            textWeight: FontWeight.w600,
            height: 50,
            radius: 12,
          ),
        ),

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
            // Positioned(top: 6.h, left: 4.w, child: BackButtonWidget()),
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
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        h4,
                        Text(
                          "registration".L(),
                          style: R.textStyles.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        h2,
                        Text(
                          "Enter your full name and phone number to create your profile",
                          style: R.textStyles.poppins(
                            fontSize: 14,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        h6,
                        // Full Name Field
                        fullNameEditText(colorScheme),

                        h3,
                        // Phone Number Field (Pakistan only - prefix style, selector disabled)
                        phoneNumber(colorScheme),

                        h3,
                        _agreeTermsCheckbox(),

                        h3,
                        // AppButton(
                        //   onPressed: _validateAndContinue,
                        //   title: "continue_button",
                        //   textColor: colorScheme.brightness == Brightness.dark
                        //       ? R.appColors.primary
                        //       : R.appColors.white,
                        //   textSize: 16,
                        //   textWeight: FontWeight.w600,
                        //   height: 50,
                        //   radius: 12,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget fullNameEditText(ColorScheme colorScheme) {
    return TextFormField(
      controller: _nameController,
      decoration: R.appDecorations.inputDecorationWithHint(
        hintText: "Full Name",
        isLocalized: false,
      ),
      style:R.textStyles.poppins(
        color: R.appColors.primary,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(60),
        FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s'-]")),
      ],
      textCapitalization: TextCapitalization.words,
      validator: (value) => AppValidator.validateFullName(value),
      onChanged: (value) {
        // Clear error on change
        if (_formKey.currentState?.validate() ?? false) {
          _formKey.currentState?.validate();
        }
      },
    );
  }

  Widget phoneNumber(ColorScheme colorScheme) {
    return InternationalPhoneNumberInput(
      spaceBetweenSelectorAndTextField: 5,
      focusNode: phoneFN,
        // selectorConfig: SelectorConfig(
          //               selectorType: PhoneInputSelectorType.DIALOG,
          //               useEmoji: true,
          //               trailingSpace: false,
          //             ),
      cursorColor: R.appColors.primary,
      countries: ['PK'],
      keyboardAction: TextInputAction.next,
      inputDecoration: R.appDecorations
          .inputDecorationWithHint(hintText: "Phone Number", isLocalized: false)
          .copyWith(
            errorText: _phoneError,

            prefixIconConstraints: BoxConstraints(maxWidth: 85, minWidth: 85),
          ),
      selectorTextStyle: R.textStyles.poppins(
        color: R.appColors.primary,
        fontSize: 13.sp,
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
      keyboardType: const TextInputType.numberWithOptions(
        signed: false,
        decimal: false,
      ),
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
                  color: R.appColors.greyColor,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(text: "agree_to".L()),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = _onTapTermsService,
                    text: "terms_and_condition".L(),
                    style: R.textStyles.poppins(
                      fontSize: 12.px,
                      color: R.appColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(text: "and".L()),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = _onTapPrivacyPolicy,
                    text: "privacy_policy".L(),
                    style: R.textStyles.poppins(
                      fontSize: 12.px,
                      color: R.appColors.primary,
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

  void _onTapTermsService() {
    Get.toNamed(TermsAndPolicyView.route, arguments: {"title": 'terms_and_condition'});
  }

  void _onTapPrivacyPolicy() {
    Get.toNamed(TermsAndPolicyView.route, arguments: {"title": 'privacy_policy'});
  }
}

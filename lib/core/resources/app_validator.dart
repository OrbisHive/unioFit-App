import 'package:flutter/services.dart';
import 'package:unio_fit/core/resources/localization/localization_map.dart';

class AppValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "please_enter_your_email".L();
    }
    final emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );

    if (!emailRegex.hasMatch(value)) {
      return "enter_a_valid_email".L();
    }

    final domainExtensionRegex = RegExp(r'\.(?:[a-zA-Z]{2,})$');
    if (!domainExtensionRegex.hasMatch(value) ||
        RegExp(r'\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})+$').hasMatch(value)) {
      return "enter_a_valid_email".L();
    }

    if (value.contains(
      RegExp(
        r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
      ),
    )) {
      return "emojis_are_not_allowed".L();
    }

    return null;
  }

  static String? validateLoginPassword(String? value) {
    if (value!.isEmpty) {
      return "please_enter_your_password".L();
    }
    if (!RegExp(r'^[^\s]').hasMatch(value)) {
      return "please_enter_your_password".L();
    }
    if (value.length < 6) {
      return "password_consists_minimum_6_character".L();
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return "please_enter_your_name".L();
    }
    if (RegExp(r'\s$').hasMatch(value)) {
      return "leading_trailing_space_not_allowed".L();
    }

    if (RegExp(r'^\s').hasMatch(value)) {
      return "leading_trailing_space_not_allowed".L();
    }
    if (!RegExp(r'^[a-zA-Z]+( [a-zA-Z]+)*$').hasMatch(value)) {
      return "invalid_name".L();
    }

    return null;
  }

  /// Validates full name according to US-002 requirements:
  /// - Min 2 characters, max 60
  /// - Only letters, hyphen, and apostrophe allowed
  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "name_required".L();
    }
    
    final trimmed = value.trim();
    
    if (trimmed.length < 2) {
      return "name_min_length".L();
    }
    
    if (trimmed.length > 60) {
      return "name_max_length".L();
    }
    
    // Allow letters, spaces, hyphen, and apostrophe
    if (!RegExp(r"^[a-zA-Z\s'-]+$").hasMatch(trimmed)) {
      return "name_invalid_characters".L();
    }
    
    return null;
  }

  /// Validates phone number according to US-003 requirements:
  /// - Numeric only
  /// - 7-15 digits
  static String? validatePhoneNumberForRegistration(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "phone_required".L();
    }
    
    final trimmed = value.trim();
    
    // Check if numeric only
    if (!RegExp(r'^\d+$').hasMatch(trimmed)) {
      return "phone_numeric_only".L();
    }
    
    // Check length
    if (trimmed.length < 7 || trimmed.length > 15) {
      return "phone_invalid_length".L();
    }
    
    return null;
  }

  static String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return "please_enter_user_name".L();
    }

    // ❌ Prevent leading or trailing spaces
    if (value.trim() != value) {
      return "leading_trailing_space_not_allowed".L();
    }

    // ✅ Allow letters, numbers, spaces, and selected special characters
    final regex = RegExp(r'^[a-zA-Z0-9!@#\$%\^&\*\(\)_\+\-=\[\]{};:"\\|,.<>\/? ]+$');

    if (!regex.hasMatch(value)) {
      return "invalid_user_name".L();
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "please_enter_your_password".L();
    }
    if (!RegExp(r'^[^\s]').hasMatch(value)) {
      return "please_enter_your_password".L();
    }
    if (value.length < 6) {
      return "password_must_be_at_least".L();
    }
    if (!RegExp(r"^(?=.*?[0-9])").hasMatch(value)) {
      return "password_must_contains_at_least_one_number".L();
    }
    if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value.trim())) {
      return "password_must_contains_at_least_one_special_character".L();
    }
    if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
      return "password_must_contains_at_least_one_upper_case".L();
    }
    if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value)) {
      return "password_must_contains_at_least_one_lower_case".L();
    }
    return null;
  }

  static String? validateNewPassword(String? value) {
    if (value!.isEmpty) {
      return "please_enter_your_new_password".L();
    }
    if (!RegExp(r'^[^\s]').hasMatch(value)) {
      return "please_enter_your_new_password".L();
    }
    if (value.length < 6) {
      return "password_must_be_at_least".L();
    }
    if (!RegExp(r"^(?=.*?[0-9])").hasMatch(value)) {
      return "password_must_contains_at_least_one_number".L();
    }
    if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value.trim())) {
      return "password_must_contains_at_least_one_special_character".L();
    }
    if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
      return "password_must_contains_at_least_one_upper_case".L();
    }
    if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value)) {
      return "password_must_contains_at_least_one_lower_case".L();
    }
    return null;
  }

  static String? validatePasswordMatch(String? value, String? pass2) {
    if (value!.isEmpty) {
      return "please_re_enter_your_password".L();
    }
    if (value != pass2) {
      return "password_did_not_match".L();
    }
    return null;
  }

  static String? validateStartDate(String? value) {
    if (value == null || value.isEmpty) {
      return "please_select_start_date".L();
    }
    return null;
  }

  static String? validateEndDate(String? value) {
    if (value == null || value.isEmpty) {
      return "please_select_end_date".L();
    }
    return null;
  }

  static String? validatePaymentLink(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "please_add_payment_link".L();
    }
    final urlPattern = r'^(https?:\/\/)?[\w\-]+(\.[\w\-]+)+[/#?]?.*$';
    final isValid = RegExp(urlPattern).hasMatch(value.trim());
    if (!isValid) {
      return "invalid_payment_link".L();
    }
    return null;
  }

  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "please_enter_title".L();
    }
    return null;
  }
  static String? validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "please_enter_description".L();
    }
    return null;
  }

  static String? validateParticipantLimit(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "please_enter_participant_limit".L();
    }
    final intValue = int.tryParse(value.trim());
    if (intValue == null || intValue <= 0) {
      return "invalid_participant_limit".L();
    }
    return null;
  }


  static String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "please_enter_price".L();
    }
    final parsed = double.tryParse(value.trim());
    if (parsed == null || parsed <= 0) {
      return "invalid_price".L();
    }
    return null;
  }

  static String? validateDOB(String? value) {
    if (value!.isEmpty) {
      return "please_select_your_date_of_birth".L();
    }
    return null;
  }

  static String? validateOTP(String? value) {
    if (value!.isEmpty) return "please_enter_your_otp".L();
    if (value.length < 6) {
      return "invalid_otp".L();
    }
    return null;
  }

  static String? validateEmpty(String? value) {
    if (value!.isEmpty) {
      return "field_required".L();
    }
    return null;
  }

  static String? validateEventName(String? value) {
    if (value!.isEmpty) {
      return "event_name_required".L();
    }
    if (RegExp(r'\s$').hasMatch(value)) {
      return "leading_trailing_space_not_allowed".L();
    }

    if (RegExp(r'^\s').hasMatch(value)) {
      return "leading_trailing_space_not_allowed".L();
    }
    if (!RegExp(r'^[a-zA-Z]+( [a-zA-Z]+)*$').hasMatch(value)) {
      return "invalid_name".L();
    }
    return null;
  }

  static String? validateEventDetail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "please_enter_event_detail".L();
    }
    return null;
  }

  static String? validateDropdown(String? value) {
    if (value == null) {
      return "field_required".L();
    }
    return null;
  }

  static String? validateBusinessLocation(String? value) {
    if (value!.isEmpty) {
      return "business_location_required".L();
    }
    return null;
  }

  static String? validateMessage(String? value) {
    if (value!.isEmpty) {
      return "message_required".L();
    }
    return null;
  }

  // Custom validator functions
  String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName ${"is_required".L()}';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) return null; // Optional field
    if (!RegExp(
      r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$',
    ).hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
  String? validateEngineModel(String? value,) {
    if (value == null || value.isEmpty) return null; // Optional field
    if (!RegExp(
      r'^([A-Z0-9]{2,5}(-[A-Z0-9]{2,5})?|\d[A-Z]{2}-[A-Z]{3}|[A-Z]{2,3}\d{2,3}|[A-Z]{2}/\d{3,4}[A-Z]?)$',
    ).hasMatch(value)) {
      return 'Enter a valid Engine Model';
    }
    return null;
  }

  String? validateYear(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    final year = int.tryParse(value) ?? 0;
    if (year < 1900 || year > DateTime.now().year + 1) {
      return 'Enter a valid year between 1900-${DateTime.now().year + 1}';
    }
    return null;
  }

  String? validatePercentage(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    final percent = int.tryParse(value.replaceAll('%', '')) ?? 0;
    if (percent < 0 || percent > 100) {
      return 'Enter a percentage between 0-100';
    }
    return null;
  }

  String? validateVin(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    if (value.length != 17) {
      return 'VIN must be 17 characters';
    }
    return null;
  }

  String? validateDecimal(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    if (double.tryParse(value) == null) {
      return '$fieldName must be a number';
    }
    return null;
  }

  String? validateInteger(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    if (int.tryParse(value) == null) {
      return '$fieldName must be a whole number';
    }
    return null;
  }

  static String? validateStaffEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "please_enter_email".L();
    }
    final emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );

    if (!emailRegex.hasMatch(value)) {
      return "enter_a_valid_email".L();
    }

    final domainExtensionRegex = RegExp(r'\.(?:[a-zA-Z]{2,})$');
    if (!domainExtensionRegex.hasMatch(value) ||
        RegExp(r'\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})+$').hasMatch(value)) {
      return "enter_a_valid_email".L();
    }

    if (value.contains(
      RegExp(
        r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
      ),
    )) {
      return "emojis_are_not_allowed".L();
    }

    return null;
  }

  static String? validateStaffPassword(String? value) {
    if (value!.isEmpty) {
      return "please_enter_password".L();
    }
    if (!RegExp(r'^[^\s]').hasMatch(value)) {
      return "please_enter_password".L();
    }
    if (value.length < 6) {
      return "password_must_be_at_least".L();
    }
    if (!RegExp(r"^(?=.*?[0-9])").hasMatch(value)) {
      return "password_must_contains_at_least_one_number".L();
    }
    if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value.trim())) {
      return "password_must_contains_at_least_one_special_character".L();
    }
    if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
      return "password_must_contains_at_least_one_upper_case".L();
    }
    if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value)) {
      return "password_must_contains_at_least_one_lower_case".L();
    }
    return null;
  }

  static String? validateMaxPrice(String? value, String? minValue) {
    if (value == null || value.isEmpty) return null;
    if ((int.tryParse(value) ?? 0) <= 0) return 'Number should be larger then 0';
    final max = double.tryParse(value);
    final min = double.tryParse(minValue ?? '');

    if (max == null) return 'Enter a valid number';
    if (min != null && max < min) return 'Max price must be greater than min price';

    return null;
  }

  static String? validateMinPrice(String? value) {
    if (value == null || value.isEmpty || value == ".") return 'Enter a valid number';
    if ((int.tryParse(value) ?? 0) <= 0) return 'Number should be larger then 0';
    return null;
  }

  static String? validateLink(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocalizationMap.getValues("please_enter_a_valid_link");
    }

    // Improved regular expression for better URL validation
    const urlPattern =
        r'^(https?:\/\/)(www\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(:\d+)?(\/.*)?$';

    if (!RegExp(urlPattern).hasMatch(value.trim())) {
      return LocalizationMap.getValues("please_enter_a_valid_link");
    }

    return null; // URL is valid
  }



}

class NoInitialSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Prevent entering a space as the initial character
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}

class StoryTextLimitingTextInputFormatter extends TextInputFormatter {
  final int maxLines;
  final int maxChars;
  final VoidCallback onLimitExceeded;

  StoryTextLimitingTextInputFormatter({
    required this.maxLines,
    required this.onLimitExceeded,
    this.maxChars = 200, // default 200 chars
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final lineCount = '\n'.allMatches(newValue.text).length + 1;
    final charCount = newValue.text.length;

    // if lines exceed OR characters exceed
    if (lineCount > maxLines || charCount > maxChars) {
      if (newValue.text.length > oldValue.text.length) {
        onLimitExceeded(); // trigger dialog
      }
      return oldValue; // block input
    }

    return newValue;
  }
}



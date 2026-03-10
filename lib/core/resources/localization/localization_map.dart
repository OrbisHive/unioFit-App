class LocalizationMap {
  static Map<String, String> get codesEN => {
    "password_should_contain_at_least_eight_character": "Password should contain at least 8 character",
    "password_should_be_alphanumeric": "Password should be alphanumeric",
    "password_should_have_capital_alphabet": "Password should have a capital alphabet",
    "password_should_1_special_character": "Password should have 1 special character",
    "email_is_required": "Please enter your email address",
    "enter_a_valid_Email": "Invalid email address",
    "please_enter_your_password": "Please enter your password",
    "please_re_enter_your_password": "Please re-enter your password",
    "password_does_not_match": "Password does mot match",
    "please_enter_your_first_name": "Please enter your name",
    "invalid_name": "Invalid name",
    "please_enter_your_last_name": "Please enter your last name",
    "gallery": "Gallery",
    "camera": "Camera",
    "remove_profile_image": "Remove Profile Image",
    "view_profile_image": "View Profile Image",
    "press_again_to_exit": "Press again to exit.",
    "no_internet_connection": "No Internet Connection",
    "oops": "Oops",
    "please_grant_required_permissions": "Please grant the required permissions",
    "open_settings": "Open Settings",
    "server_error":"Server Error",
    "back":"Back",
    "please_enter_otp":"Please enter OTP",
    "please_enter_your_otp":"Please enter your OTP",
    "invalid_otp":"Invalid OTP",
    "did_not_get_code":"Did not get code",
    "resend_otp":"Resend OTP",
    "verify":"Verify",
    "continue_button":"Continue",
    "register":"Register",
    "already_have_account":"Already have an account? Sign in",
    "forgot_password_help":"Forgot Password?",
    "otp_sent_message":"We'll send an OTP to your number",
    "name_required":"Name is required",
    "name_min_length":"Name must be at least 2 characters",
    "name_max_length":"Name must not exceed 60 characters",
    "name_invalid_characters":"Name can only contain letters, hyphen, and apostrophe",
    "phone_required":"Phone number is required",
    "phone_invalid_length":"Phone number must be between 7 and 15 digits",
    "phone_numeric_only":"Phone number must contain only numbers",
    "country_code_required":"Country code is required",
    "otp_verification_success":"OTP verified successfully",
    "otp_verification_failed":"Invalid OTP. Please try again",
    "registration_success":"Registration successful",
    "didnt_receive_code":"Didn't receive code?",
    "ok":"OK",
    "welcome_text":"Welcome Back 👋",
    "login_to_continue":"Login to continue",
    "email_address":"Email Address",
    "password":"Password",
    "enter_password":"Enter password",
    "forgot_password":"Forgot Password?",
    "login":"Login",
    "don't_have_account":"Don't have an account? ",
    "sign_up":"Sign Up",
    // Login SignUp
    "welcome_back": "Welcome back!",
    "we_missed_you": "We missed you !",
    "enter_email": "Enter your email",
      "or_login_with": "Or Login with",
    "hello": "Hello!",
    "register_to_get_started": "Register to get started",
    "full_name": "Full Name",
    "username": "Username",
    "email": "Email",
    "confirm_password": "Confirm password",
    "confirm_password_cap": "Confirm Password",
    "agree_to": "I Agree to the ",
    "terms_and_condition": "Terms of Service ",
    "and": "and ",
    "privacy_policy": "Privacy Policy",
    "create": "Create",
    "already_have_account_login": "Already have an account? Login",
    "otp_verification": "OTP Verification",
    "enter_verification_code":
    "Enter the verification code we just sent you via text message on your phone number.",
    "resend_code": "Didn't receive the code?",
    "resend": "Resend",
    "account_created": "Account Created",
    "account_created_success": "Your account has been created successfully.",
    "back_to_login": "Back to Login",
    "forgot_password_subtitle":
    "Don't worry! It occurs. Please enter the email address linked with your account.",
    "send_code": "Send Code",
    "remember_password": "Remember Password?",
    "create_new_password": "Create new password",
    "create_password_subtitle":
    "Your new password must be unique from those previously used.",
    "new_password": "New Password",
    "reset_password": "Reset Password",
    "change_password": "Change Password",
    "password_changed": "Password Changed!",
    "password_changed_success": "Your password has been changed successfully.",
    "no_profiles_available": "No profiles available",
    // App metadata
    "app_name": "Unio Fit",
    
    // Navigation & Screens
    "error": "Error",
    "dashboard": "Dashboard",
    "registration": "Registration",
    "registration_screen": "Registration Screen",
    
    // Splash Screen
    "splash_tagline": "Your Fitness Journey Starts Here",
    
    // Common
    "loading": "Loading...",
    "placeholder_button": "Placeholder Button",
    "clean_architecture_ready": "Clean Architecture + Riverpod Ready",
    "pre_filled_phone": "Pre-filled phone:",
    "this_screen_will_be_implemented": "This screen will be implemented in future user stories.",
    "dashboard_screen_text": "Dashboard Screen",
    "route_not_found": "Route not found:",

  };

  static String getValues(String key) {
    return codesEN[key] ?? "";

  }
}

extension Localize on String {
  String L() {
    return LocalizationMap.getValues(this);
  }
}

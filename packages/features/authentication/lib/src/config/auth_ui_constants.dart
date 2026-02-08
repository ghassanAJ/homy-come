/// UI constants for authentication screens
abstract class AuthUIConstants {
  // Animation durations
  static const int transitionDurationMs = 300;
  static const int headerAnimationDurationMs = 200;

  // Form validation
  static const int minPhoneLength = 10;

  // Regular expressions
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // Error messages
  static const String invalidEmailError = 'Please enter a valid email address';
  static const String invalidPhoneError = 'Please enter a valid phone number';
  static const String fieldRequiredError = 'This field is required';
}

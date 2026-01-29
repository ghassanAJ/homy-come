// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;

String get _languageCode => 'en';
String get _localeName => 'en';

String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class AuthenticationTranslation implements i69n.I69nMessageBundle {
  const AuthenticationTranslation();
  CommonAuthenticationTranslation get common =>
      CommonAuthenticationTranslation(this);
  AuthIdentityAuthenticationTranslation get authIdentity =>
      AuthIdentityAuthenticationTranslation(this);
  VerificationAuthenticationTranslation get verification =>
      VerificationAuthenticationTranslation(this);
  PersonalInfoAuthenticationTranslation get personalInfo =>
      PersonalInfoAuthenticationTranslation(this);
  UserRoleAuthenticationTranslation get userRole =>
      UserRoleAuthenticationTranslation(this);
  OnboardingAuthenticationTranslation get onboarding =>
      OnboardingAuthenticationTranslation(this);
  ChildLoginAuthenticationTranslation get childLogin =>
      ChildLoginAuthenticationTranslation(this);
  LoginAuthenticationTranslation get login =>
      LoginAuthenticationTranslation(this);
  SocialLoginAuthenticationTranslation get socialLogin =>
      SocialLoginAuthenticationTranslation(this);
  TermsAndPrivacyAuthenticationTranslation get termsAndPrivacy =>
      TermsAndPrivacyAuthenticationTranslation(this);
  String get title => "Sign In";
  String get description => "Sign in to your account";
  LabelAuthenticationTranslation get label =>
      LabelAuthenticationTranslation(this);
  SupportiveTextAuthenticationTranslation get supportiveText =>
      SupportiveTextAuthenticationTranslation(this);
  ErrorAuthenticationTranslation get error =>
      ErrorAuthenticationTranslation(this);
  SignUpPhoneAuthenticationTranslation get signUpPhone =>
      SignUpPhoneAuthenticationTranslation(this);
  SignUpOTPAuthenticationTranslation get signUpOTP =>
      SignUpOTPAuthenticationTranslation(this);
  SignUpPasswordAuthenticationTranslation get signUpPassword =>
      SignUpPasswordAuthenticationTranslation(this);
  SignUpOnboardingDetailAuthenticationTranslation get signUpOnboardingDetail =>
      SignUpOnboardingDetailAuthenticationTranslation(this);
  CreateNewPasswordAuthenticationTranslation get createNewPassword =>
      CreateNewPasswordAuthenticationTranslation(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'common':
        return common;
      case 'authIdentity':
        return authIdentity;
      case 'verification':
        return verification;
      case 'personalInfo':
        return personalInfo;
      case 'userRole':
        return userRole;
      case 'onboarding':
        return onboarding;
      case 'childLogin':
        return childLogin;
      case 'login':
        return login;
      case 'socialLogin':
        return socialLogin;
      case 'termsAndPrivacy':
        return termsAndPrivacy;
      case 'title':
        return title;
      case 'description':
        return description;
      case 'label':
        return label;
      case 'supportiveText':
        return supportiveText;
      case 'error':
        return error;
      case 'signUpPhone':
        return signUpPhone;
      case 'signUpOTP':
        return signUpOTP;
      case 'signUpPassword':
        return signUpPassword;
      case 'signUpOnboardingDetail':
        return signUpOnboardingDetail;
      case 'createNewPassword':
        return createNewPassword;
      default:
        return key;
    }
  }
}

class CommonAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const CommonAuthenticationTranslation(this._parent);
  String get continueLabel => "Continue";
  String get next => "next";
  String get back => "Back";
  String get cancel => "Cancel";
  String get submit => "Submit";
  String get done => "Done";
  String get skip => "Skip";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'continueLabel':
        return continueLabel;
      case 'next':
        return next;
      case 'back':
        return back;
      case 'cancel':
        return cancel;
      case 'submit':
        return submit;
      case 'done':
        return done;
      case 'skip':
        return skip;
      default:
        return key;
    }
  }
}

class AuthIdentityAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const AuthIdentityAuthenticationTranslation(this._parent);
  String get emailTitle => "Email";
  String get phoneTitle => "Phone number";
  String get emailSubtitle => "Add Email Address you would like to use";
  String get phoneSubtitle => "Add Phone number you would like to use";
  String get sendVerificationCode => "Send verification code";
  String get orContinueWith => "Or continue with";
  String get apple => "Apple";
  String get google => "Google";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'emailTitle':
        return emailTitle;
      case 'phoneTitle':
        return phoneTitle;
      case 'emailSubtitle':
        return emailSubtitle;
      case 'phoneSubtitle':
        return phoneSubtitle;
      case 'sendVerificationCode':
        return sendVerificationCode;
      case 'orContinueWith':
        return orContinueWith;
      case 'apple':
        return apple;
      case 'google':
        return google;
      default:
        return key;
    }
  }
}

class VerificationAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const VerificationAuthenticationTranslation(this._parent);
  String get title => "Verification";
  String get description => "Enter the verification code sent to";
  String get didntReceiveCode => "Didn't receive the code?";
  String get resend => "Resend";
  String get resendIn => "Resend in {time}";
  String get verificationCodeSent => "Verification code sent successfully";
  String get invalidCode => "Invalid verification code";
  String get codeSent => "Code sent successfully";
  String get newUserVerified =>
      "Verification successful! Let's set up your profile";
  String get returningUserVerified => "Welcome back! We're logging you in...";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'description':
        return description;
      case 'didntReceiveCode':
        return didntReceiveCode;
      case 'resend':
        return resend;
      case 'resendIn':
        return resendIn;
      case 'verificationCodeSent':
        return verificationCodeSent;
      case 'invalidCode':
        return invalidCode;
      case 'codeSent':
        return codeSent;
      case 'newUserVerified':
        return newUserVerified;
      case 'returningUserVerified':
        return returningUserVerified;
      default:
        return key;
    }
  }
}

class PersonalInfoAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const PersonalInfoAuthenticationTranslation(this._parent);
  String get title => "Personal Information";
  String get subtitle => "Complete your info";
  String get username => "Username";
  String get usernamePlaceholder => "e.g., ahmed_khan";
  String get usernameRequired => "Please enter a username";
  String get firstName => "First Name";
  String get firstNamePlaceholder => "e.g., Ahmed";
  String get firstNameRequired => "Please enter your first name";
  String get lastName => "Last Name";
  String get lastNamePlaceholder => "e.g., Al Mansouri";
  String get lastNameRequired => "Please enter your last name";
  String get nickname => "Nickname (optional)";
  String get nicknamePlaceholder => "e.g., Hamood";
  String get dateOfBirth => "Date of Birth";
  String get dateOfBirthPlaceholder => "Select date";
  String get dateOfBirthRequired => "Please enter your date of birth";
  String get gender => "Gender";
  String get male => "Male";
  String get female => "Female";
  String get accountCreated =>
      "Welcome! Your account has been created successfully";
  String get profileCompleted => "All set! Welcome to Maddo 🎉";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'subtitle':
        return subtitle;
      case 'username':
        return username;
      case 'usernamePlaceholder':
        return usernamePlaceholder;
      case 'usernameRequired':
        return usernameRequired;
      case 'firstName':
        return firstName;
      case 'firstNamePlaceholder':
        return firstNamePlaceholder;
      case 'firstNameRequired':
        return firstNameRequired;
      case 'lastName':
        return lastName;
      case 'lastNamePlaceholder':
        return lastNamePlaceholder;
      case 'lastNameRequired':
        return lastNameRequired;
      case 'nickname':
        return nickname;
      case 'nicknamePlaceholder':
        return nicknamePlaceholder;
      case 'dateOfBirth':
        return dateOfBirth;
      case 'dateOfBirthPlaceholder':
        return dateOfBirthPlaceholder;
      case 'dateOfBirthRequired':
        return dateOfBirthRequired;
      case 'gender':
        return gender;
      case 'male':
        return male;
      case 'female':
        return female;
      case 'accountCreated':
        return accountCreated;
      case 'profileCompleted':
        return profileCompleted;
      default:
        return key;
    }
  }
}

class UserRoleAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const UserRoleAuthenticationTranslation(this._parent);
  String get welcomeEmoji => "👋";
  String get welcomeTitle => "Welcome to maddo";
  String get welcomeSubtitle => "the smart way to teach kids\nmoney skills.";
  String get parent => "Parent";
  String get parentDescription => "Manage children' money and help them learn";
  String get child => "Child";
  String get childDescription => "Save money and have fun learning";
  String get guest => "Continue as guest";
  String get guestDescription => "Explore the app before creating an account";
  String get continueButton => "Continue";
  String get imTheParent => "I'm the parent";
  String get imTheChild => "I'm the child";
  String get imAGuest => "I'm a guest";
  String get guestModeNotSupported => "Guest mode is not supported yet";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'welcomeEmoji':
        return welcomeEmoji;
      case 'welcomeTitle':
        return welcomeTitle;
      case 'welcomeSubtitle':
        return welcomeSubtitle;
      case 'parent':
        return parent;
      case 'parentDescription':
        return parentDescription;
      case 'child':
        return child;
      case 'childDescription':
        return childDescription;
      case 'guest':
        return guest;
      case 'guestDescription':
        return guestDescription;
      case 'continueButton':
        return continueButton;
      case 'imTheParent':
        return imTheParent;
      case 'imTheChild':
        return imTheChild;
      case 'imAGuest':
        return imAGuest;
      case 'guestModeNotSupported':
        return guestModeNotSupported;
      default:
        return key;
    }
  }
}

class OnboardingAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const OnboardingAuthenticationTranslation(this._parent);
  String get slide1Title => "the digital debit card designed for families";
  String get slide1Subtitle => "Digital & physical,  safe and simple to use.";
  String get slide2Title => "send and receive money with a tap";
  String get slide2Subtitle => "Kids learn saving, spending, and goal-setting";
  String get slide3Title => "Help your children learn the value of money";
  String get slide3Subtitle =>
      "Set limits, track spending, guide responsible habits";
  String get getStarted => "Let's get started";
  String get skip => "Skip";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'slide1Title':
        return slide1Title;
      case 'slide1Subtitle':
        return slide1Subtitle;
      case 'slide2Title':
        return slide2Title;
      case 'slide2Subtitle':
        return slide2Subtitle;
      case 'slide3Title':
        return slide3Title;
      case 'slide3Subtitle':
        return slide3Subtitle;
      case 'getStarted':
        return getStarted;
      case 'skip':
        return skip;
      default:
        return key;
    }
  }
}

class ChildLoginAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const ChildLoginAuthenticationTranslation(this._parent);
  String get title => "Child Login";
  String get description => "Ask your parent for the 6-digit passcode";
  String get hint => "Tap the boxes to enter your code";
  String get loginButton => "Continue";
  String get orLoginWith => "Or continue with";
  EncouragementChildLoginAuthenticationTranslation get encouragement =>
      EncouragementChildLoginAuthenticationTranslation(this);
  ErrorChildLoginAuthenticationTranslation get error =>
      ErrorChildLoginAuthenticationTranslation(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'description':
        return description;
      case 'hint':
        return hint;
      case 'loginButton':
        return loginButton;
      case 'orLoginWith':
        return orLoginWith;
      case 'encouragement':
        return encouragement;
      case 'error':
        return error;
      default:
        return key;
    }
  }
}

class EncouragementChildLoginAuthenticationTranslation
    implements i69n.I69nMessageBundle {
  final ChildLoginAuthenticationTranslation _parent;
  const EncouragementChildLoginAuthenticationTranslation(this._parent);
  String get typing => "You're doing great! Keep going! 👍";
  String get almostThere => "Almost there! Just a few more! 🌟";
  String get success => "Amazing! Welcome back! 🎉";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'typing':
        return typing;
      case 'almostThere':
        return almostThere;
      case 'success':
        return success;
      default:
        return key;
    }
  }
}

class ErrorChildLoginAuthenticationTranslation
    implements i69n.I69nMessageBundle {
  final ChildLoginAuthenticationTranslation _parent;
  const ErrorChildLoginAuthenticationTranslation(this._parent);
  String get wrongCode =>
      "Oops! That code didn't work. Ask your parent to help you try again";
  String get tryAgain => "No worries, let's try again!";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'wrongCode':
        return wrongCode;
      case 'tryAgain':
        return tryAgain;
      default:
        return key;
    }
  }
}

class LoginAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const LoginAuthenticationTranslation(this._parent);
  String get title => "Login with PIN";
  String get subtitle => "Enter your 6-digit PIN to continue";
  String get passcodeLabel => "Passcode";
  String get loginButton => "Login";
  String get verificationCodeSent => "Verification code sent successfully";
  String get loginSuccessful => "Login successful!";
  String get invalidPin => "Invalid PIN. Please try again.";
  String get otpVerifiedSuccessfully => "OTP verified successfully";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'subtitle':
        return subtitle;
      case 'passcodeLabel':
        return passcodeLabel;
      case 'loginButton':
        return loginButton;
      case 'verificationCodeSent':
        return verificationCodeSent;
      case 'loginSuccessful':
        return loginSuccessful;
      case 'invalidPin':
        return invalidPin;
      case 'otpVerifiedSuccessfully':
        return otpVerifiedSuccessfully;
      default:
        return key;
    }
  }
}

class SocialLoginAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const SocialLoginAuthenticationTranslation(this._parent);
  String get orLoginWith => "Or login with";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'orLoginWith':
        return orLoginWith;
      default:
        return key;
    }
  }
}

class TermsAndPrivacyAuthenticationTranslation
    implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const TermsAndPrivacyAuthenticationTranslation(this._parent);
  String get agreementText => "By continuing, you agree to the";
  String get termsOfUse => "Terms of use";
  String get and => "and";
  String get privacyPolicy => "Privacy policy";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'agreementText':
        return agreementText;
      case 'termsOfUse':
        return termsOfUse;
      case 'and':
        return and;
      case 'privacyPolicy':
        return privacyPolicy;
      default:
        return key;
    }
  }
}

class LabelAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const LabelAuthenticationTranslation(this._parent);
  String get signIn => "sign In";
  String get register => "register";
  String get phone => "Phone";
  String get email => "Email";
  String get password => "Password";
  String get forgotPassword => "Forgot password?";
  String get nextButton => "next";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'signIn':
        return signIn;
      case 'register':
        return register;
      case 'phone':
        return phone;
      case 'email':
        return email;
      case 'password':
        return password;
      case 'forgotPassword':
        return forgotPassword;
      case 'nextButton':
        return nextButton;
      default:
        return key;
    }
  }
}

class SupportiveTextAuthenticationTranslation
    implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const SupportiveTextAuthenticationTranslation(this._parent);
  String get email => "Enter your email address";
  String get phone => "Enter your phone number";
  String get password => "Enter 4 digits numeric password";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'email':
        return email;
      case 'phone':
        return phone;
      case 'password':
        return password;
      default:
        return key;
    }
  }
}

class ErrorAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const ErrorAuthenticationTranslation(this._parent);
  String get email => "Please enter a valid email address";
  String get password => "Please enter a valid password";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'email':
        return email;
      case 'password':
        return password;
      default:
        return key;
    }
  }
}

class SignUpPhoneAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const SignUpPhoneAuthenticationTranslation(this._parent);
  String get title => "What's your mobile number?";
  String get iWantToUseEmail => "I want to use";
  String get myEmail => "my email";
  String get phone => "Enter your phone number";
  String get disclaimerText =>
      "We will send you a text with a verification code. Message and data rates may apply. By continuing, you agree to our";
  String get termsAndConditions => "Terms & Conditions";
  String get privacyPolicy => "Privacy Policy";
  String get and => "and";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'iWantToUseEmail':
        return iWantToUseEmail;
      case 'myEmail':
        return myEmail;
      case 'phone':
        return phone;
      case 'disclaimerText':
        return disclaimerText;
      case 'termsAndConditions':
        return termsAndConditions;
      case 'privacyPolicy':
        return privacyPolicy;
      case 'and':
        return and;
      default:
        return key;
    }
  }
}

class SignUpOTPAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const SignUpOTPAuthenticationTranslation(this._parent);
  String get otpResendSuccessfully => "OTP resend successfully";
  String get verificationCodeSent => "Verification code sent";
  String get description =>
      "We have sent a verification code to your phone number";
  String get resendCode => "send a new code.";
  String get didntReceiveCode => "didn't receive a code?";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'otpResendSuccessfully':
        return otpResendSuccessfully;
      case 'verificationCodeSent':
        return verificationCodeSent;
      case 'description':
        return description;
      case 'resendCode':
        return resendCode;
      case 'didntReceiveCode':
        return didntReceiveCode;
      default:
        return key;
    }
  }
}

class SignUpPasswordAuthenticationTranslation
    implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const SignUpPasswordAuthenticationTranslation(this._parent);
  String get title => "Create your PIN";
  String get description => "Create a secure 4-digit PIN for your account";
  String get enterPin => "Enter PIN";
  String get confirmPassword => "Confirm PIN";
  String get yourPinWillBeUsedToSecureYourAccount =>
      "Your PIN will be used to secure your account";
  String get pinDoNotMatch => "PINs do not match. Please try again.";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'description':
        return description;
      case 'enterPin':
        return enterPin;
      case 'confirmPassword':
        return confirmPassword;
      case 'yourPinWillBeUsedToSecureYourAccount':
        return yourPinWillBeUsedToSecureYourAccount;
      case 'pinDoNotMatch':
        return pinDoNotMatch;
      default:
        return key;
    }
  }
}

class SignUpOnboardingDetailAuthenticationTranslation
    implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const SignUpOnboardingDetailAuthenticationTranslation(this._parent);
  String get title => "Let's get to know you";
  String get name => "What's your name?";
  String get nameLabel => "As per Emirates ID";
  String get whoAreYou => "Who are you?";
  String get continueLabel => "Continue";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'name':
        return name;
      case 'nameLabel':
        return nameLabel;
      case 'whoAreYou':
        return whoAreYou;
      case 'continueLabel':
        return continueLabel;
      default:
        return key;
    }
  }
}

class CreateNewPasswordAuthenticationTranslation
    implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const CreateNewPasswordAuthenticationTranslation(this._parent);
  String get passwordLabel => "Password";
  String get rePasswordLabel => "Re-enter password";
  RulesCreateNewPasswordAuthenticationTranslation get rules =>
      RulesCreateNewPasswordAuthenticationTranslation(this);
  String get sendResetLink => "Send reset link";
  String get resetSuccess => "Password reset successful!";
  String get otpSentSuccessfully => "OTP sent successfully";
  String get otpVerifiedSuccessfully => "OTP verified successfully";
  VerificationCodeCreateNewPasswordAuthenticationTranslation
      get verificationCode =>
          VerificationCodeCreateNewPasswordAuthenticationTranslation(this);
  ForgotPasswordCreateNewPasswordAuthenticationTranslation get forgotPassword =>
      ForgotPasswordCreateNewPasswordAuthenticationTranslation(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'passwordLabel':
        return passwordLabel;
      case 'rePasswordLabel':
        return rePasswordLabel;
      case 'rules':
        return rules;
      case 'sendResetLink':
        return sendResetLink;
      case 'resetSuccess':
        return resetSuccess;
      case 'otpSentSuccessfully':
        return otpSentSuccessfully;
      case 'otpVerifiedSuccessfully':
        return otpVerifiedSuccessfully;
      case 'verificationCode':
        return verificationCode;
      case 'forgotPassword':
        return forgotPassword;
      default:
        return key;
    }
  }
}

class RulesCreateNewPasswordAuthenticationTranslation
    implements i69n.I69nMessageBundle {
  final CreateNewPasswordAuthenticationTranslation _parent;
  const RulesCreateNewPasswordAuthenticationTranslation(this._parent);
  String get length => "Password must be at least 8 characters long";
  String get match => "Passwords must match";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'length':
        return length;
      case 'match':
        return match;
      default:
        return key;
    }
  }
}

class VerificationCodeCreateNewPasswordAuthenticationTranslation
    implements i69n.I69nMessageBundle {
  final CreateNewPasswordAuthenticationTranslation _parent;
  const VerificationCodeCreateNewPasswordAuthenticationTranslation(
      this._parent);
  String get title => "Please enter the verification code sent to {userInput}";
  ResendVerificationCodeCreateNewPasswordAuthenticationTranslation get resend =>
      ResendVerificationCodeCreateNewPasswordAuthenticationTranslation(this);
  String get sendResetLink => "Send reset link";
  String get createNewPasswordTitle => "Create new password";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'resend':
        return resend;
      case 'sendResetLink':
        return sendResetLink;
      case 'createNewPasswordTitle':
        return createNewPasswordTitle;
      default:
        return key;
    }
  }
}

class ResendVerificationCodeCreateNewPasswordAuthenticationTranslation
    implements i69n.I69nMessageBundle {
  final VerificationCodeCreateNewPasswordAuthenticationTranslation _parent;
  const ResendVerificationCodeCreateNewPasswordAuthenticationTranslation(
      this._parent);
  String get question => "Didn't receive a code?";
  String get action => "Send a new code.";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'question':
        return question;
      case 'action':
        return action;
      default:
        return key;
    }
  }
}

class ForgotPasswordCreateNewPasswordAuthenticationTranslation
    implements i69n.I69nMessageBundle {
  final CreateNewPasswordAuthenticationTranslation _parent;
  const ForgotPasswordCreateNewPasswordAuthenticationTranslation(this._parent);
  String get emailInstruction =>
      "Please enter your email address to reset your password";
  String get phoneInstruction =>
      "Please enter your mobile number to reset your password";
  String get emailLabel => "Email address";
  String get phoneLabel => "Phone Number";
  ToggleForgotPasswordCreateNewPasswordAuthenticationTranslation get toggle =>
      ToggleForgotPasswordCreateNewPasswordAuthenticationTranslation(this);
  String get sendResetLink => "Send reset link";
  String get verificationTitle => "Forgot Password";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'emailInstruction':
        return emailInstruction;
      case 'phoneInstruction':
        return phoneInstruction;
      case 'emailLabel':
        return emailLabel;
      case 'phoneLabel':
        return phoneLabel;
      case 'toggle':
        return toggle;
      case 'sendResetLink':
        return sendResetLink;
      case 'verificationTitle':
        return verificationTitle;
      default:
        return key;
    }
  }
}

class ToggleForgotPasswordCreateNewPasswordAuthenticationTranslation
    implements i69n.I69nMessageBundle {
  final ForgotPasswordCreateNewPasswordAuthenticationTranslation _parent;
  const ToggleForgotPasswordCreateNewPasswordAuthenticationTranslation(
      this._parent);
  String get toPhone => "Reset with mobile OTP";
  String get toEmail => "Reset with email";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'toPhone':
        return toPhone;
      case 'toEmail':
        return toEmail;
      default:
        return key;
    }
  }
}

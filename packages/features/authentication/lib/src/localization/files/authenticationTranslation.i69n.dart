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
  LoginAuthenticationTranslation get login =>
      LoginAuthenticationTranslation(this);
  VerificationAuthenticationTranslation get verification =>
      VerificationAuthenticationTranslation(this);
  PersonalInfoAuthenticationTranslation get personalInfo =>
      PersonalInfoAuthenticationTranslation(this);
  AuthEntryAuthenticationTranslation get authEntry =>
      AuthEntryAuthenticationTranslation(this);
  OnboardingAuthenticationTranslation get onboarding =>
      OnboardingAuthenticationTranslation(this);
  UserRoleAuthenticationTranslation get userRole =>
      UserRoleAuthenticationTranslation(this);
  AuthIdentityAuthenticationTranslation get authIdentity =>
      AuthIdentityAuthenticationTranslation(this);
  ChildLoginAuthenticationTranslation get childLogin =>
      ChildLoginAuthenticationTranslation(this);
  TermsAndPrivacyAuthenticationTranslation get termsAndPrivacy =>
      TermsAndPrivacyAuthenticationTranslation(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'common':
        return common;
      case 'login':
        return login;
      case 'verification':
        return verification;
      case 'personalInfo':
        return personalInfo;
      case 'authEntry':
        return authEntry;
      case 'onboarding':
        return onboarding;
      case 'userRole':
        return userRole;
      case 'authIdentity':
        return authIdentity;
      case 'childLogin':
        return childLogin;
      case 'termsAndPrivacy':
        return termsAndPrivacy;
      default:
        return key;
    }
  }
}

class CommonAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const CommonAuthenticationTranslation(this._parent);
  String get continueLabel => "Continue";
  String get skip => "Skip";
  String get logout => "Logout";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'continueLabel':
        return continueLabel;
      case 'skip':
        return skip;
      case 'logout':
        return logout;
      default:
        return key;
    }
  }
}

class LoginAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const LoginAuthenticationTranslation(this._parent);
  String get title => "Enter Your Phone Number for Verification";
  String get phoneLabel => "Phone Number";
  String get verifyButton => "Verify";
  String get signUp => "Sign up";
  String get joinAsGuest => "Join as guest";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'phoneLabel':
        return phoneLabel;
      case 'verifyButton':
        return verifyButton;
      case 'signUp':
        return signUp;
      case 'joinAsGuest':
        return joinAsGuest;
      default:
        return key;
    }
  }
}

class VerificationAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const VerificationAuthenticationTranslation(this._parent);
  String get title => "Enter the Code to Continue";
  String get description =>
      "A verification code has been sent to {userInput} via SMS.";
  String get didntReceive => "Didn't receive?";
  String get resendCode => "Resend Code";
  String get resend => "resend";
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
      case 'didntReceive':
        return didntReceive;
      case 'resendCode':
        return resendCode;
      case 'resend':
        return resend;
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
  String get title => "Complete Your Profile";
  String get subtitle => "Please fill in your personal information";
  String get username => "Username";
  String get usernamePlaceholder => "Enter your username";
  String get usernameRequired => "Username is required";
  String get firstName => "First Name";
  String get firstNamePlaceholder => "Enter your first name";
  String get firstNameRequired => "First name is required";
  String get lastName => "Last Name";
  String get lastNamePlaceholder => "Enter your last name";
  String get lastNameRequired => "Last name is required";
  String get dateOfBirth => "Date of Birth";
  String get dateOfBirthPlaceholder => "Select your date of birth";
  String get dateOfBirthRequired => "Date of birth is required";
  String get gender => "Gender";
  String get male => "Male";
  String get female => "Female";
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
      case 'profileCompleted':
        return profileCompleted;
      default:
        return key;
    }
  }
}

class AuthEntryAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const AuthEntryAuthenticationTranslation(this._parent);
  String get pinLabel => "password";
  String get loginButton => "login";
  String get sendVerificationCode => "send verification code";
  String get orLoginWith => "or login with";
  String get orContinueWith => "or continue with";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'pinLabel':
        return pinLabel;
      case 'loginButton':
        return loginButton;
      case 'sendVerificationCode':
        return sendVerificationCode;
      case 'orLoginWith':
        return orLoginWith;
      case 'orContinueWith':
        return orContinueWith;
      default:
        return key;
    }
  }
}

class OnboardingAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const OnboardingAuthenticationTranslation(this._parent);
  String get introTitle => "Best Helping\nHands for you";
  String get introSubtitle =>
      "With Our On-Demand Services App,\nWe Give Better Services To You.";
  String get getStarted => "Gets Started";
  String get slide1Title => "Security & Privacy";
  String get slide1Subtitle =>
      "We ensure top-level protection of user data, maintaining full privacy to provide a safe and trusted experience.";
  String get slide2Title => "Fast Ordering & Convenience";
  String get slide2Subtitle =>
      "The app is designed to make service requests quick and effortless, offering a smooth and comfortable experience from selection to delivery.";
  String get slide3Title => "Easy Service Selection";
  String get slide3Subtitle =>
      "A simple and intuitive interface that allows users to choose the right service in just a few steps, with well-organized categories for fast and hassle-free browsing.";
  String get finish => "Finish";
  String get skip => "skip";
  String get next => "Next";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'introTitle':
        return introTitle;
      case 'introSubtitle':
        return introSubtitle;
      case 'getStarted':
        return getStarted;
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
      case 'finish':
        return finish;
      case 'skip':
        return skip;
      case 'next':
        return next;
      default:
        return key;
    }
  }
}

class UserRoleAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const UserRoleAuthenticationTranslation(this._parent);
  String get welcome => "Welcome to maddo";
  String get welcomeSubtitle => "the smart way to teach kids money skills.";
  String get imTheParent => "I'm the parent";
  String get imTheChild => "I'm the child";
  String get imAGuest => "I'm a guest";
  String get continueButton => "Continue";
  String get guestModeNotSupported => "Guest mode is not supported yet";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'welcome':
        return welcome;
      case 'welcomeSubtitle':
        return welcomeSubtitle;
      case 'imTheParent':
        return imTheParent;
      case 'imTheChild':
        return imTheChild;
      case 'imAGuest':
        return imAGuest;
      case 'continueButton':
        return continueButton;
      case 'guestModeNotSupported':
        return guestModeNotSupported;
      default:
        return key;
    }
  }
}

class AuthIdentityAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const AuthIdentityAuthenticationTranslation(this._parent);
  String get emailTitle => "Email";
  String get emailSubtitle => "Add Email Address you would like to use";
  String get phoneTitle => "Phone number";
  String get phoneSubtitle => "Add Phone number you would like to use";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'emailTitle':
        return emailTitle;
      case 'emailSubtitle':
        return emailSubtitle;
      case 'phoneTitle':
        return phoneTitle;
      case 'phoneSubtitle':
        return phoneSubtitle;
      default:
        return key;
    }
  }
}

class ChildLoginAuthenticationTranslation implements i69n.I69nMessageBundle {
  final AuthenticationTranslation _parent;
  const ChildLoginAuthenticationTranslation(this._parent);
  String get title => "Child Login";
  String get subtitle => "Ask your parent for the 6-digit passcode";
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

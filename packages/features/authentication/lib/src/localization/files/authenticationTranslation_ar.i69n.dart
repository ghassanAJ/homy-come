// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'authenticationTranslation.i69n.dart';

String get _languageCode => 'ar';
String get _localeName => 'ar';

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

class AuthenticationTranslation_ar extends AuthenticationTranslation {
  const AuthenticationTranslation_ar();
  CommonAuthenticationTranslation_ar get common =>
      CommonAuthenticationTranslation_ar(this);
  AuthIdentityAuthenticationTranslation_ar get authIdentity =>
      AuthIdentityAuthenticationTranslation_ar(this);
  VerificationAuthenticationTranslation_ar get verification =>
      VerificationAuthenticationTranslation_ar(this);
  PersonalInfoAuthenticationTranslation_ar get personalInfo =>
      PersonalInfoAuthenticationTranslation_ar(this);
  UserRoleAuthenticationTranslation_ar get userRole =>
      UserRoleAuthenticationTranslation_ar(this);
  OnboardingAuthenticationTranslation_ar get onboarding =>
      OnboardingAuthenticationTranslation_ar(this);
  ChildLoginAuthenticationTranslation_ar get childLogin =>
      ChildLoginAuthenticationTranslation_ar(this);
  LoginAuthenticationTranslation_ar get login =>
      LoginAuthenticationTranslation_ar(this);
  SocialLoginAuthenticationTranslation_ar get socialLogin =>
      SocialLoginAuthenticationTranslation_ar(this);
  TermsAndPrivacyAuthenticationTranslation_ar get termsAndPrivacy =>
      TermsAndPrivacyAuthenticationTranslation_ar(this);
  String get title => "تسجيل الدخول";
  String get description => "سجّل الدخول إلى حسابك";
  LabelAuthenticationTranslation_ar get label =>
      LabelAuthenticationTranslation_ar(this);
  SupportiveTextAuthenticationTranslation_ar get supportiveText =>
      SupportiveTextAuthenticationTranslation_ar(this);
  ErrorAuthenticationTranslation_ar get error =>
      ErrorAuthenticationTranslation_ar(this);
  SignUpPhoneAuthenticationTranslation_ar get signUpPhone =>
      SignUpPhoneAuthenticationTranslation_ar(this);
  SignUpOTPAuthenticationTranslation_ar get signUpOTP =>
      SignUpOTPAuthenticationTranslation_ar(this);
  SignUpPasswordAuthenticationTranslation_ar get signUpPassword =>
      SignUpPasswordAuthenticationTranslation_ar(this);
  SignUpOnboardingDetailAuthenticationTranslation_ar
      get signUpOnboardingDetail =>
          SignUpOnboardingDetailAuthenticationTranslation_ar(this);
  CreateNewPasswordAuthenticationTranslation_ar get createNewPassword =>
      CreateNewPasswordAuthenticationTranslation_ar(this);
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
        return super[key];
    }
  }
}

class CommonAuthenticationTranslation_ar
    extends CommonAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const CommonAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get continueLabel => "متابعة";
  String get next => "التالي";
  String get back => "رجوع";
  String get cancel => "إلغاء";
  String get submit => "إرسال";
  String get done => "تم";
  String get skip => "تخطي";
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
        return super[key];
    }
  }
}

class AuthIdentityAuthenticationTranslation_ar
    extends AuthIdentityAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const AuthIdentityAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get emailTitle => "البريد الإلكتروني";
  String get phoneTitle => "رقم الهاتف";
  String get emailSubtitle => "أضف عنوان البريد الإلكتروني الذي تريد استخدامه";
  String get phoneSubtitle => "أضف رقم الهاتف الذي تريد استخدامه";
  String get sendVerificationCode => "إرسال رمز التحقق";
  String get orContinueWith => "أو تابع باستخدام";
  String get apple => "أبل";
  String get google => "جوجل";
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
        return super[key];
    }
  }
}

class VerificationAuthenticationTranslation_ar
    extends VerificationAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const VerificationAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get title => "التحقق";
  String get description => "أدخل رمز التحقق المرسل إلى";
  String get didntReceiveCode => "لم تستلم الرمز؟";
  String get resend => "إعادة الإرسال";
  String get resendIn => "إعادة الإرسال خلال {time}";
  String get verificationCodeSent => "تم إرسال رمز التحقق بنجاح";
  String get invalidCode => "رمز التحقق غير صحيح";
  String get codeSent => "تم إرسال الرمز بنجاح";
  String get newUserVerified => "تم التحقق بنجاح! دعنا نجهز ملفك الشخصي";
  String get returningUserVerified => "مرحباً بعودتك! جاري تسجيل دخولك...";
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
        return super[key];
    }
  }
}

class PersonalInfoAuthenticationTranslation_ar
    extends PersonalInfoAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const PersonalInfoAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get title => "المعلومات الشخصية";
  String get subtitle => "أكمل بياناتك";
  String get username => "اسم المستخدم";
  String get usernamePlaceholder => "مثلاً، ahmed_khan";
  String get usernameRequired => "الرجاء إدخال اسم المستخدم";
  String get firstName => "الاسم الأول";
  String get firstNamePlaceholder => "مثلاً، أحمد";
  String get firstNameRequired => "الرجاء إدخال اسمك الأول";
  String get lastName => "اسم العائلة";
  String get lastNamePlaceholder => "مثلاً، المنصوري";
  String get lastNameRequired => "الرجاء إدخال اسم عائلتك";
  String get nickname => "اللقب (اختياري)";
  String get nicknamePlaceholder => "مثلاً، حمود";
  String get dateOfBirth => "تاريخ الميلاد";
  String get dateOfBirthPlaceholder => "اختر التاريخ";
  String get dateOfBirthRequired => "الرجاء إدخال تاريخ ميلادك";
  String get gender => "الجنس";
  String get male => "ذكر";
  String get female => "أنثى";
  String get accountCreated => "مرحباً! تم إنشاء حسابك بنجاح";
  String get profileCompleted => "كل شيء جاهز! مرحباً بك في مادو 🎉";
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
        return super[key];
    }
  }
}

class UserRoleAuthenticationTranslation_ar
    extends UserRoleAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const UserRoleAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get welcomeEmoji => "👋";
  String get welcomeTitle => "مرحباً بك في مادو";
  String get welcomeSubtitle =>
      "الطريقة الذكية لتعليم الأطفال\nمهارات التعامل مع المال.";
  String get parent => "ولي الأمر";
  String get parentDescription => "إدارة مصروف الأطفال ومساعدتهم على التعلم";
  String get child => "الطفل";
  String get childDescription => "ادخر المال واستمتع بالتعلم";
  String get guest => "المتابعة كزائر";
  String get guestDescription => "استكشف التطبيق قبل إنشاء حساب";
  String get continueButton => "متابعة";
  String get imTheParent => "أنا ولي الأمر";
  String get imTheChild => "أنا الطفل";
  String get imAGuest => "أنا زائر";
  String get guestModeNotSupported => "وضع الزائر غير مدعوم بعد";
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
        return super[key];
    }
  }
}

class OnboardingAuthenticationTranslation_ar
    extends OnboardingAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const OnboardingAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get slide1Title => "البطاقة المصرفية الرقمية المصممة للعائلات";
  String get slide1Subtitle => "رقمية ومادية، آمنة وسهلة الاستخدام.";
  String get slide2Title => "أرسل واستلم المال بلمسة واحدة";
  String get slide2Subtitle => "يتعلم الأطفال الادخار والإنفاق وتحديد الأهداف";
  String get slide3Title => "ساعد أطفالك على تعلم قيمة المال";
  String get slide3Subtitle =>
      "حدد الحدود، تتبع المصروفات، ووجه العادات المسؤولة";
  String get getStarted => "لنبدأ";
  String get skip => "تخطي";
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
        return super[key];
    }
  }
}

class ChildLoginAuthenticationTranslation_ar
    extends ChildLoginAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const ChildLoginAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get title => "تسجيل دخول الطفل";
  String get description => "اطلب من والديك رمز الدخول المكون من 6 أرقام";
  String get hint => "اضغط على المربعات لإدخال الرمز";
  String get loginButton => "متابعة";
  String get orLoginWith => "أو تابع باستخدام";
  EncouragementChildLoginAuthenticationTranslation_ar get encouragement =>
      EncouragementChildLoginAuthenticationTranslation_ar(this);
  ErrorChildLoginAuthenticationTranslation_ar get error =>
      ErrorChildLoginAuthenticationTranslation_ar(this);
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
        return super[key];
    }
  }
}

class EncouragementChildLoginAuthenticationTranslation_ar
    extends EncouragementChildLoginAuthenticationTranslation {
  final ChildLoginAuthenticationTranslation_ar _parent;
  const EncouragementChildLoginAuthenticationTranslation_ar(this._parent)
      : super(_parent);
  String get typing => "أحسنت! استمر! 👍";
  String get almostThere => "كاد أن يكتمل! بضع خطوات أخرى! 🌟";
  String get success => "رائع! مرحباً بعودتك! 🎉";
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
        return super[key];
    }
  }
}

class ErrorChildLoginAuthenticationTranslation_ar
    extends ErrorChildLoginAuthenticationTranslation {
  final ChildLoginAuthenticationTranslation_ar _parent;
  const ErrorChildLoginAuthenticationTranslation_ar(this._parent)
      : super(_parent);
  String get wrongCode =>
      "عذراً! هذا الرمز غير صحيح. اطلب من والديك المساعدة للمحاولة مرة أخرى";
  String get tryAgain => "لا تقلق، لنحاول مرة أخرى!";
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
        return super[key];
    }
  }
}

class LoginAuthenticationTranslation_ar extends LoginAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const LoginAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get title => "تسجيل الدخول برمز PIN";
  String get subtitle => "أدخل رمز PIN المكون من 6 أرقام للمتابعة";
  String get passcodeLabel => "رمز الدخول";
  String get loginButton => "تسجيل الدخول";
  String get verificationCodeSent => "تم إرسال رمز التحقق بنجاح";
  String get loginSuccessful => "تم تسجيل الدخول بنجاح!";
  String get invalidPin => "رمز PIN غير صحيح. الرجاء المحاولة مرة أخرى.";
  String get otpVerifiedSuccessfully => "تم التحقق من OTP بنجاح";
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
        return super[key];
    }
  }
}

class SocialLoginAuthenticationTranslation_ar
    extends SocialLoginAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const SocialLoginAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get orLoginWith => "أو سجّل الدخول باستخدام";
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
        return super[key];
    }
  }
}

class TermsAndPrivacyAuthenticationTranslation_ar
    extends TermsAndPrivacyAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const TermsAndPrivacyAuthenticationTranslation_ar(this._parent)
      : super(_parent);
  String get agreementText => "بمتابعتك، أنت توافق على";
  String get termsOfUse => "شروط الاستخدام";
  String get and => "و";
  String get privacyPolicy => "سياسة الخصوصية";
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
        return super[key];
    }
  }
}

class LabelAuthenticationTranslation_ar extends LabelAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const LabelAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get signIn => "تسجيل الدخول";
  String get register => "التسجيل";
  String get phone => "الهاتف";
  String get email => "البريد الإلكتروني";
  String get password => "كلمة المرور";
  String get forgotPassword => "نسيت كلمة المرور؟";
  String get nextButton => "التالي";
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
        return super[key];
    }
  }
}

class SupportiveTextAuthenticationTranslation_ar
    extends SupportiveTextAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const SupportiveTextAuthenticationTranslation_ar(this._parent)
      : super(_parent);
  String get email => "أدخل عنوان بريدك الإلكتروني";
  String get phone => "أدخل رقم هاتفك";
  String get password => "أدخل كلمة مرور رقمية من 4 أرقام";
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
        return super[key];
    }
  }
}

class ErrorAuthenticationTranslation_ar extends ErrorAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const ErrorAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get email => "الرجاء إدخال عنوان بريد إلكتروني صحيح";
  String get password => "الرجاء إدخال كلمة مرور صحيحة";
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
        return super[key];
    }
  }
}

class SignUpPhoneAuthenticationTranslation_ar
    extends SignUpPhoneAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const SignUpPhoneAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get title => "ما رقم هاتفك المحمول؟";
  String get iWantToUseEmail => "أريد استخدام";
  String get myEmail => "بريدي الإلكتروني";
  String get phone => "أدخل رقم هاتفك";
  String get disclaimerText =>
      "سنرسل لك رسالة نصية تتضمن رمز التحقق. قد تطبق رسوم الرسائل والبيانات. بمتابعتك، أنت توافق على";
  String get termsAndConditions => "الشروط والأحكام";
  String get privacyPolicy => "سياسة الخصوصية";
  String get and => "و";
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
        return super[key];
    }
  }
}

class SignUpOTPAuthenticationTranslation_ar
    extends SignUpOTPAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const SignUpOTPAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get otpResendSuccessfully => "تم إعادة إرسال OTP بنجاح";
  String get verificationCodeSent => "تم إرسال رمز التحقق";
  String get description => "لقد أرسلنا رمز التحقق إلى رقم هاتفك";
  String get resendCode => "إرسال رمز جديد.";
  String get didntReceiveCode => "لم تستلم الرمز؟";
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
        return super[key];
    }
  }
}

class SignUpPasswordAuthenticationTranslation_ar
    extends SignUpPasswordAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const SignUpPasswordAuthenticationTranslation_ar(this._parent)
      : super(_parent);
  String get title => "إنشاء رمز PIN";
  String get description => "أنشئ رمز PIN آمن مكون من 4 أرقام لحسابك";
  String get enterPin => "أدخل رمز PIN";
  String get confirmPassword => "تأكيد رمز PIN";
  String get yourPinWillBeUsedToSecureYourAccount =>
      "سيتم استخدام رمز PIN لتأمين حسابك";
  String get pinDoNotMatch => "رموز PIN غير متطابقة. الرجاء المحاولة مرة أخرى.";
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
        return super[key];
    }
  }
}

class SignUpOnboardingDetailAuthenticationTranslation_ar
    extends SignUpOnboardingDetailAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const SignUpOnboardingDetailAuthenticationTranslation_ar(this._parent)
      : super(_parent);
  String get title => "دعنا نتعرف عليك";
  String get name => "ما اسمك؟";
  String get nameLabel => "كما في الهوية الإماراتية";
  String get whoAreYou => "من أنت؟";
  String get continueLabel => "متابعة";
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
        return super[key];
    }
  }
}

class CreateNewPasswordAuthenticationTranslation_ar
    extends CreateNewPasswordAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const CreateNewPasswordAuthenticationTranslation_ar(this._parent)
      : super(_parent);
  String get passwordLabel => "كلمة المرور";
  String get rePasswordLabel => "أعد إدخال كلمة المرور";
  RulesCreateNewPasswordAuthenticationTranslation_ar get rules =>
      RulesCreateNewPasswordAuthenticationTranslation_ar(this);
  String get sendResetLink => "إرسال رابط إعادة التعيين";
  String get resetSuccess => "تم إعادة تعيين كلمة المرور بنجاح!";
  String get otpSentSuccessfully => "تم إرسال OTP بنجاح";
  String get otpVerifiedSuccessfully => "تم التحقق من OTP بنجاح";
  VerificationCodeCreateNewPasswordAuthenticationTranslation_ar
      get verificationCode =>
          VerificationCodeCreateNewPasswordAuthenticationTranslation_ar(this);
  ForgotPasswordCreateNewPasswordAuthenticationTranslation_ar
      get forgotPassword =>
          ForgotPasswordCreateNewPasswordAuthenticationTranslation_ar(this);
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
        return super[key];
    }
  }
}

class RulesCreateNewPasswordAuthenticationTranslation_ar
    extends RulesCreateNewPasswordAuthenticationTranslation {
  final CreateNewPasswordAuthenticationTranslation_ar _parent;
  const RulesCreateNewPasswordAuthenticationTranslation_ar(this._parent)
      : super(_parent);
  String get length => "يجب أن تتكون كلمة المرور من 8 أحرف على الأقل";
  String get match => "يجب أن تتطابق كلمات المرور";
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
        return super[key];
    }
  }
}

class VerificationCodeCreateNewPasswordAuthenticationTranslation_ar
    extends VerificationCodeCreateNewPasswordAuthenticationTranslation {
  final CreateNewPasswordAuthenticationTranslation_ar _parent;
  const VerificationCodeCreateNewPasswordAuthenticationTranslation_ar(
      this._parent)
      : super(_parent);
  String get title => "الرجاء إدخال رمز التحقق المرسل إلى {userInput}";
  ResendVerificationCodeCreateNewPasswordAuthenticationTranslation_ar
      get resend =>
          ResendVerificationCodeCreateNewPasswordAuthenticationTranslation_ar(
              this);
  String get sendResetLink => "إرسال رابط إعادة التعيين";
  String get createNewPasswordTitle => "إنشاء كلمة مرور جديدة";
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
        return super[key];
    }
  }
}

class ResendVerificationCodeCreateNewPasswordAuthenticationTranslation_ar
    extends ResendVerificationCodeCreateNewPasswordAuthenticationTranslation {
  final VerificationCodeCreateNewPasswordAuthenticationTranslation_ar _parent;
  const ResendVerificationCodeCreateNewPasswordAuthenticationTranslation_ar(
      this._parent)
      : super(_parent);
  String get question => "لم تستلم الرمز؟";
  String get action => "إرسال رمز جديد.";
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
        return super[key];
    }
  }
}

class ForgotPasswordCreateNewPasswordAuthenticationTranslation_ar
    extends ForgotPasswordCreateNewPasswordAuthenticationTranslation {
  final CreateNewPasswordAuthenticationTranslation_ar _parent;
  const ForgotPasswordCreateNewPasswordAuthenticationTranslation_ar(
      this._parent)
      : super(_parent);
  String get emailInstruction =>
      "الرجاء إدخال عنوان بريدك الإلكتروني لإعادة تعيين كلمة المرور";
  String get phoneInstruction =>
      "الرجاء إدخال رقم هاتفك المحمول لإعادة تعيين كلمة المرور";
  String get emailLabel => "عنوان البريد الإلكتروني";
  String get phoneLabel => "رقم الهاتف";
  ToggleForgotPasswordCreateNewPasswordAuthenticationTranslation_ar
      get toggle =>
          ToggleForgotPasswordCreateNewPasswordAuthenticationTranslation_ar(
              this);
  String get sendResetLink => "إرسال رابط إعادة التعيين";
  String get verificationTitle => "نسيت كلمة المرور";
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
        return super[key];
    }
  }
}

class ToggleForgotPasswordCreateNewPasswordAuthenticationTranslation_ar
    extends ToggleForgotPasswordCreateNewPasswordAuthenticationTranslation {
  final ForgotPasswordCreateNewPasswordAuthenticationTranslation_ar _parent;
  const ToggleForgotPasswordCreateNewPasswordAuthenticationTranslation_ar(
      this._parent)
      : super(_parent);
  String get toPhone => "إعادة التعيين برمز OTP للجوال";
  String get toEmail => "إعادة التعيين بالبريد الإلكتروني";
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
        return super[key];
    }
  }
}

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
  LoginAuthenticationTranslation_ar get login =>
      LoginAuthenticationTranslation_ar(this);
  VerificationAuthenticationTranslation_ar get verification =>
      VerificationAuthenticationTranslation_ar(this);
  PersonalInfoAuthenticationTranslation_ar get personalInfo =>
      PersonalInfoAuthenticationTranslation_ar(this);
  AuthEntryAuthenticationTranslation_ar get authEntry =>
      AuthEntryAuthenticationTranslation_ar(this);
  OnboardingAuthenticationTranslation_ar get onboarding =>
      OnboardingAuthenticationTranslation_ar(this);
  UserRoleAuthenticationTranslation_ar get userRole =>
      UserRoleAuthenticationTranslation_ar(this);
  AuthIdentityAuthenticationTranslation_ar get authIdentity =>
      AuthIdentityAuthenticationTranslation_ar(this);
  ChildLoginAuthenticationTranslation_ar get childLogin =>
      ChildLoginAuthenticationTranslation_ar(this);
  TermsAndPrivacyAuthenticationTranslation_ar get termsAndPrivacy =>
      TermsAndPrivacyAuthenticationTranslation_ar(this);
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
        return super[key];
    }
  }
}

class CommonAuthenticationTranslation_ar
    extends CommonAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const CommonAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get continueLabel => "متابعة";
  String get skip => "تخطي";
  String get logout => "تسجيل الخروج";
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
        return super[key];
    }
  }
}

class LoginAuthenticationTranslation_ar extends LoginAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const LoginAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get title => "أدخل رقم هاتفك للتحقق";
  String get phoneLabel => "رقم الهاتف";
  String get verifyButton => "تحقق";
  String get signUp => "تسجيل";
  String get joinAsGuest => "الدخول كزائر";
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
        return super[key];
    }
  }
}

class VerificationAuthenticationTranslation_ar
    extends VerificationAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const VerificationAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get title => "أدخل الرمز للمتابعة";
  String get description => "تم إرسال رمز التحقق\nإلى {userInput} عبر SMS.";
  String get enterCodePlaceholder => "أدخل الرمز هنا";
  String get didntReceive => "لم تستلم؟";
  String get resendCode => "إعادة إرسال الرمز";
  String get resend => "إعادة الإرسال";
  String get codeSent => "تم إرسال الرمز بنجاح";
  String get newUserVerified => "تم التحقق بنجاح";
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
      case 'enterCodePlaceholder':
        return enterCodePlaceholder;
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
        return super[key];
    }
  }
}

class PersonalInfoAuthenticationTranslation_ar
    extends PersonalInfoAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const PersonalInfoAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get title => "أكمل ملفك الشخصي";
  String get subtitle => "أضف معلوماتك لإنشاء حساب جديد";
  String get personalPhoto => "الصورة الشخصية";
  String get addPhoto => "إضافة صورة";
  String get fullName => "الاسم الكامل";
  String get userNamePlaceholder => "اسم المستخدم";
  String get emailPlaceholder => "user name @ gmail.com";
  String get phonePlaceholder => "+971 50 123 4567";
  String get country => "الدولة";
  String get countryPlaceholder => "دولة المستخدم";
  String get usernamePlaceholder => "أدخل اسم المستخدم";
  String get usernameRequired => "اسم المستخدم مطلوب";
  String get firstName => "الاسم الأول";
  String get firstNamePlaceholder => "أدخل اسمك الأول";
  String get firstNameRequired => "الاسم الأول مطلوب";
  String get lastName => "اسم العائلة";
  String get lastNamePlaceholder => "أدخل اسم عائلتك";
  String get lastNameRequired => "اسم العائلة مطلوب";
  String get dateOfBirth => "تاريخ الميلاد";
  String get dateOfBirthPlaceholder => "اختر تاريخ ميلادك";
  String get dateOfBirthRequired => "تاريخ الميلاد مطلوب";
  String get gender => "الجنس";
  String get male => "ذكر";
  String get female => "أنثى";
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
      case 'personalPhoto':
        return personalPhoto;
      case 'addPhoto':
        return addPhoto;
      case 'fullName':
        return fullName;
      case 'userNamePlaceholder':
        return userNamePlaceholder;
      case 'emailPlaceholder':
        return emailPlaceholder;
      case 'phonePlaceholder':
        return phonePlaceholder;
      case 'country':
        return country;
      case 'countryPlaceholder':
        return countryPlaceholder;
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
        return super[key];
    }
  }
}

class AuthEntryAuthenticationTranslation_ar
    extends AuthEntryAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const AuthEntryAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get pinLabel => "كلمة المرور";
  String get loginButton => "تسجيل الدخول";
  String get sendVerificationCode => "إرسال رمز التحقق";
  String get orLoginWith => "أو سجّل الدخول باستخدام";
  String get orContinueWith => "أو تابع باستخدام";
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
        return super[key];
    }
  }
}

class OnboardingAuthenticationTranslation_ar
    extends OnboardingAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const OnboardingAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get introTitle => "أفضل خدمات\nبين يديك";
  String get introSubtitle =>
      "تطبيق الخدمات عند الطلب يمنحك\nتجربة سريعة، سهلة، وموثوقة.";
  String get getStarted => "ابدأ الآن";
  String get slide1Title => "الأمان والخصوصية";
  String get slide1Subtitle =>
      "نضمن أعلى مستويات حماية بيانات المستخدمين، مع الحفاظ الكامل على الخصوصية لتقديم تجربة آمنة وموثوقة.";
  String get slide2Title => "الطلب السريع والسهولة";
  String get slide2Subtitle =>
      "تم تصميم التطبيق لجعل طلب الخدمات سريعًا وسهلًا، مع توفير تجربة سلسة ومريحة من اختيار الخدمة حتى استلامها.";
  String get slide3Title => "اختيار الخدمة بسهولة";
  String get slide3Subtitle =>
      "واجهة بسيطة وسهلة الاستخدام تُمكّن المستخدم من اختيار الخدمة المناسبة خلال خطوات قليلة، مع تصنيفات منظمة لتصفح سريع وبدون تعقيد.";
  String get finish => "إنهاء";
  String get skip => "تخطي";
  String get next => "متابعة";
  String get securityVerificationTitle => "التحقق الأمني";
  String get securityVerificationDescription =>
      "هذا أول تسجيل دخول لك من هذا الجهاز.\nلضمان أمان حسابك،\nيرجى التحقق من هويتك.";
  String get startToVerify => "ابدأ التحقق";
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
      case 'securityVerificationTitle':
        return securityVerificationTitle;
      case 'securityVerificationDescription':
        return securityVerificationDescription;
      case 'startToVerify':
        return startToVerify;
      default:
        return super[key];
    }
  }
}

class UserRoleAuthenticationTranslation_ar
    extends UserRoleAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const UserRoleAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get welcome => "مرحباً بك في مادو";
  String get welcomeSubtitle =>
      "الطريقة الذكية لتعليم الأطفال مهارات التعامل مع المال.";
  String get imTheParent => "أنا ولي الأمر";
  String get imTheChild => "أنا الطفل";
  String get imAGuest => "أنا زائر";
  String get continueButton => "متابعة";
  String get guestModeNotSupported => "وضع الزائر غير مدعوم بعد";
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
        return super[key];
    }
  }
}

class AuthIdentityAuthenticationTranslation_ar
    extends AuthIdentityAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const AuthIdentityAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get emailTitle => "البريد الإلكتروني";
  String get emailSubtitle => "أضف عنوان البريد الإلكتروني الذي تريد استخدامه";
  String get phoneTitle => "رقم الهاتف";
  String get phoneSubtitle => "أضف رقم الهاتف الذي تريد استخدامه";
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
        return super[key];
    }
  }
}

class ChildLoginAuthenticationTranslation_ar
    extends ChildLoginAuthenticationTranslation {
  final AuthenticationTranslation_ar _parent;
  const ChildLoginAuthenticationTranslation_ar(this._parent) : super(_parent);
  String get title => "تسجيل دخول الطفل";
  String get subtitle => "اطلب من والديك رمز الدخول المكون من 6 أرقام";
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

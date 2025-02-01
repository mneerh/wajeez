import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'ucpvwl5y': {
      'en': 'Train Stations',
      'ar': 'محطات القطار',
    },
    'll3py0od': {
      'en': 'Buy Tickets',
      'ar': 'شراء التذاكر',
    },
    'ejfv7i31': {
      'en': 'My Tickets',
      'ar': 'تذاكري',
    },
    'zlnpm0j0': {
      'en': 'Notification',
      'ar': 'إشعارات',
    },
    'dzlrr5ei': {
      'en': 'Account',
      'ar': 'حساب',
    },
    'r862y24f': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Auth2
  {
    'py5fmci7': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    'qt4gd375': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    'wpyah6hv': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': 'ابدأ بملء النموذج أدناه.',
    },
    '847g92su': {
      'en': 'First Name',
      'ar': 'الأسم الأول',
    },
    'zu3fe7mv': {
      'en': 'Last Name',
      'ar': 'اسم العائلة',
    },
    'kopsojnv': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
    },
    'pfldqx37': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    '4vd01ite': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'aeo5frjb': {
      'en': 'Confirm password',
      'ar': 'تأكيد كلمة المرور',
    },
    'pa935t3p': {
      'en': 'Password do not match',
      'ar': 'كلمة المرور غير متطابقة',
    },
    '981uten3': {
      'en': 'Sign Up',
      'ar': ' الدخول',
    },
    'ipf577w3': {
      'en': 'Log In',
      'ar': 'تسجيل الدخول',
    },
    '3uw14dej': {
      'en': 'Welcome Back',
      'ar': 'مرحبًا بعودتك',
    },
    'ndal7o9b': {
      'en': 'Fill out the information below in order to access your account.',
      'ar': 'قم بملء المعلومات أدناه لتتمكن من الوصول إلى حسابك.',
    },
    'sme0p9qh': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    '6wawmc7z': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'mqkyun17': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    '3w4z8pxa': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
    },
    '3taz31hj': {
      'en': 'Email is required',
      'ar': 'البريد الإلكتروني مطلوب',
    },
    '0vz8a2s0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة ادناه',
    },
    'leiqrxn2': {
      'en': 'Password is required',
      'ar': 'كلمة المرور مطلوبة',
    },
    'kx11gxha': {
      'en': 'Password must be 6 or more characters',
      'ar': 'يجب أن تكون كلمة المرور مكونة من 6 أحرف أو أكثر',
    },
    '19po6grr': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة ادناه',
    },
    'cgecb39n': {
      'en': 'Home Page',
      'ar': 'بيت',
    },
  },
  // profile
  {
    '1dh4yz6w': {
      'en': 'Train Stations',
      'ar': 'محطات القطار',
    },
    '5oupukcz': {
      'en': 'Buy Tickets',
      'ar': 'شراء تذاكر',
    },
    'fxxaf5e9': {
      'en': 'My Tickets',
      'ar': 'تذاكري',
    },
    'imgfj5oe': {
      'en': 'Notification',
      'ar': 'الإشعارات',
    },
    '1xbxrxim': {
      'en': 'Account',
      'ar': 'حساب',
    },
    '59xab1rh': {
      'en': 'My Profile',
      'ar': 'حسابي',
    },
    'p2mbop1l': {
      'en': '@',
      'ar': '@',
    },
    'tetsupo1': {
      'en': 'My Account Information',
      'ar': 'معلومات حسابي الشخصي',
    },
    'do6m4g8e': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور ',
    },
    'cs1e4qjg': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    'x7jj1rdz': {
      'en': 'Support',
      'ar': 'الدعم',
    },
    'jur7ss18': {
      'en': 'FAQ',
      'ar': 'الاسئلة الشائعة',
    },
    'vnccknje': {
      'en': 'Send a message',
      'ar': 'إرسال رسالة',
    },
    'ioo8bep2': {
      'en': 'Log Out',
      'ar': 'تسجيل خروج',
    },
    'xg1m6gv7': {
      'en': '__',
      'ar': '__',
    },
  },
  // editInformation
  {
    'kv16c6g4': {
      'en': 'Edit Information',
      'ar': 'تعديل الملف الشخصي',
    },
    'bj9tfq7g': {
      'en': 'First Name',
      'ar': 'الاسم الأول',
    },
    '1k3hyae0': {
      'en': 'TextField',
      'ar': '',
    },
    'cegd3w76': {
      'en': 'Last Name',
      'ar': 'اسم العائلة',
    },
    'vvyx0zem': {
      'en': 'TextField',
      'ar': '',
    },
    '5x6jnyio': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
    },
    'wihofhij': {
      'en': 'TextField',
      'ar': '',
    },
    '7gv2g5r6': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    'm68v9qmh': {
      'en': 'Home Page',
      'ar': 'بيت',
    },
  },
  // BuyTickets
  {
    'zwwvc9ns': {
      'en': 'Train Stations',
      'ar': 'محطات القطار',
    },
    'ih2u55bi': {
      'en': 'Buy Tickets',
      'ar': 'شراء تذاكر',
    },
    '69f1oocp': {
      'en': 'My Tickets',
      'ar': 'تذاكري',
    },
    'zok5397n': {
      'en': 'Notification',
      'ar': 'الإشعارات',
    },
    'bw419399': {
      'en': 'Account',
      'ar': 'الحساب',
    },
    'e3wcwhyd': {
      'en': 'Tickets',
      'ar': 'التذاكر',
    },
    '8u06qij7': {
      'en': 'Choose you preferred ticket.',
      'ar': 'اختر تذكرة',
    },
    'j04hg71u': {
      'en': 'SR',
      'ar': 'ريال',
    },
    'kd8xxp1q': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // MyTickets
  {
    'h26w8zu4': {
      'en': 'Train Stations',
      'ar': 'محطات القطار',
    },
    'bdclkf37': {
      'en': 'Buy Tickets',
      'ar': 'شراء تذاكر',
    },
    'dfb92w5z': {
      'en': 'My Tickets',
      'ar': 'تذاكري',
    },
    '90q8wl2v': {
      'en': 'Notification',
      'ar': 'الإشعارات',
    },
    'xqtgoif7': {
      'en': 'Account',
      'ar': 'الحساب',
    },
    '77wl76m7': {
      'en': 'Buy Ticket',
      'ar': 'شراء تذاكر',
    },
    '7bpuv38t': {
      'en': 'My Tickets',
      'ar': 'تذاكري',
    },
    'lursdmkt': {
      'en': 'open',
      'ar': 'افتح',
    },
    'ntpd097q': {
      'en': 'Ticket ID:',
      'ar': 'رقم التذكرة:',
    },
    'r9xe4vhn': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Savings
  {
    'iofauvm9': {
      'en': 'Train Stations',
      'ar': 'محطات القطار',
    },
    '2w3gntlm': {
      'en': 'Buy Tickets',
      'ar': 'شراء تذاكر',
    },
    'rmgwnqr0': {
      'en': 'My Tickets',
      'ar': 'تذاكري',
    },
    'jvt5qwyt': {
      'en': 'Notification',
      'ar': 'الإشعارات',
    },
    'y2rd0iti': {
      'en': 'Track Savings',
      'ar': '',
    },
    '2klb1xb0': {
      'en': 'Account',
      'ar': 'الحساب',
    },
    'ojy3otrn': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // ForgotPasswordPage
  {
    '7vwejk9d': {
      'en': 'Back',
      'ar': 'رجوع للخلف',
    },
    '4i20zh84': {
      'en': 'Forgot Password',
      'ar': 'نسيت كلمة المرور',
    },
    'xy22ap94': {
      'en':
          'No worries! Please enter the email address associated with your account, and we will send you instructions on how to reset your password.',
      'ar':
          'لا مشكلة! فضلًا ادخل بريدك الإلكتروني المرتبط بحسابك ، وسوف نرسل لك بريد لتغيير كلمة المرور.',
    },
    'orsu2p6q': {
      'en': 'Your email address...',
      'ar': 'البريد الإلكتروني',
    },
    'kd9pn9jr': {
      'en': 'Enter your email...',
      'ar': 'ادخل بريدك الإلكتروني ',
    },
    'ps832bv5': {
      'en': 'Your email address... is required',
      'ar': 'بريدك الإلكتروني مطلوب',
    },
    'f0kmz619': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'اختر خيار من القائمة.',
    },
    '7hlc1qkb': {
      'en': 'Next',
      'ar': 'التالي',
    },
    '50q7k3of': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // resetPassword
  {
    'i82596i6': {
      'en': 'Back',
      'ar': 'خلف',
    },
    '43xfpat5': {
      'en': 'Reset Password',
      'ar': 'استرجاع كلمة المرور',
    },
    'fw103nqr': {
      'en':
          'Enter your new password and we will change it for you. Remember to note it down somewhere so you don\'t forget this time! :)',
      'ar':
          'ادخل كلمة المرور الجديدة. لا تنسى ان تضعها في الملاحظات حتى لا تنساها مجددًا ! :)',
    },
    'eic3r0gc': {
      'en': 'Your new password',
      'ar': 'كلمة المرور الجديدة',
    },
    'nlvlr8gz': {
      'en': 'Enter your new password...',
      'ar': 'ادخل كلمة المرور الجديدة',
    },
    '6img96r9': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    'bfj2qn67': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // TicketDetails
  {
    'jvdcdt5r': {
      'en': 'Ticket Details',
      'ar': 'تفاصيل التذكرة',
    },
    '8ge3ljgj': {
      'en': '*Ticket activation starts immediately after payment.',
      'ar': 'سيتم تفعيل التذكرة فور شرائك لها.',
    },
    'wftnz7w7': {
      'en': 'SR',
      'ar': 'ريال ',
    },
    'cpqg7sjc': {
      'en': 'Number of Tickets:',
      'ar': 'عدد التذاكر:',
    },
    'k787lxf6': {
      'en': 'Check Out',
      'ar': 'الذهاب للدفع',
    },
    'fz0i1pbi': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // splash
  {
    'epvzdxn3': {
      'en':
          'Your Gateway to Seamless Metro Travel in Riyadh.\nPlan, ride, and explore with ease!',
      'ar':
          'بوابتك إلى تجربة سفر سلسة عبر مترو الرياض. خطط واستقل القطار واستكشف بكل سهولة!',
    },
    'lrfhopx8': {
      'en': 'Get Started',
      'ar': 'البدء',
    },
    '3k2drhp5': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // ForgotPasswordVerifyOTP
  {
    'cethkjjl': {
      'en': 'Back',
      'ar': 'خلف',
    },
    'hjsr0krg': {
      'en': 'Enter OTP code',
      'ar': 'أدخل رمز OTP',
    },
    'qnk7d0mf': {
      'en':
          'Please enter the six digit pass code that we sent to the email address you provided',
      'ar':
          'الرجاء إدخال رمز المرور المكون من ستة أرقام المرسل إلى عنوان البريد الإلكتروني الذي قدمته',
    },
    '1w5j6d86': {
      'en': 'Next',
      'ar': 'التالي',
    },
    '9x0z9s9z': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // CheckingOut
  {
    'q2qogxtl': {
      'en': 'Checking Out',
      'ar': 'الذهاب للدفع',
    },
    'u5mj5fs4': {
      'en': 'Price per Ticket:',
      'ar': 'سعر التذكرة الواحدة:',
    },
    'n9d1h91m': {
      'en': 'SR',
      'ar': 'ريال سعودي',
    },
    'ie4fgy9z': {
      'en': 'Promocode:',
      'ar': 'كوبون الخصم:',
    },
    '1e0533ox': {
      'en': 'Promocode',
      'ar': 'كوبون الخصم',
    },
    'ndz5x3ea': {
      'en': 'APPLY',
      'ar': 'اخصم',
    },
    'fa5sgh1m': {
      'en': 'SubTotal:',
      'ar': 'المجموع الفرعي:',
    },
    'yy6xhjgx': {
      'en': 'SR',
      'ar': 'ريال سعودي',
    },
    '60a0s2hf': {
      'en': '-',
      'ar': '-',
    },
    '8tnagpbl': {
      'en': 'SR',
      'ar': 'ريال سعودي',
    },
    'cc9yt78x': {
      'en': 'Total:',
      'ar': 'المجموع:',
    },
    '92n4kww4': {
      'en': 'SR',
      'ar': 'ريال سعودي',
    },
    'b2hq6g15': {
      'en': 'Pay',
      'ar': 'ادفع',
    },
    '07i88o2p': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Payment
  {
    '77tq42f5': {
      'en': 'Checking Out',
      'ar': 'الذهاب للدفع',
    },
    '2gj3t0w2': {
      'en': 'Your Info',
      'ar': 'معلوماتي',
    },
    'wq122pzt': {
      'en': 'Purchase Invoice:',
      'ar': 'فاتورة الشراء:',
    },
    'qhsihvub': {
      'en': 'Number of Tickets:',
      'ar': 'عدد التذاكر:',
    },
    'k4p1p4t7': {
      'en': 'Total to pay:',
      'ar': 'المجموع :',
    },
    'zivvsii5': {
      'en': 'SR',
      'ar': 'ريال سعودي',
    },
    'jltl4hes': {
      'en': 'enter your Credit/ Debit Card information',
      'ar': 'أدخل معلومات بطاقة الائتمان/الخصم الخاصة بك',
    },
    'wf25z367': {
      'en': 'Card Number',
      'ar': 'رقم البطاقة',
    },
    'ab5actoq': {
      'en': 'eg: 1111222233334444',
      'ar': 'على سبيل المثال: 1111222233334444',
    },
    'bhxfeiqd': {
      'en': 'Card Holder',
      'ar': 'حامل البطاقة',
    },
    'umiwiq9f': {
      'en': 'eg: FAHD SALMAN',
      'ar': 'مثلا: فهد سلمان',
    },
    'cj5qswqc': {
      'en': 'Exp Date',
      'ar': 'تاريخ الإنتهاء',
    },
    '3uf6cy0n': {
      'en': 'eg: MM/YY',
      'ar': 'على سبيل المثال: الشهر/السنة',
    },
    'qifhe47z': {
      'en': 'CVV',
      'ar': ' رمز التحقق',
    },
    '41mzvusk': {
      'en': 'eg: 123',
      'ar': 'مثلا: 123',
    },
    'mlnmzinu': {
      'en': 'CONFIRM PAYMENT',
      'ar': 'تأكيد الدفع',
    },
    'mhw1m6pc': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // changePassword
  {
    'mkg80g7s': {
      'en': 'Back',
      'ar': 'الرجوع للخلف',
    },
    'moms6w6t': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
    },
    'lpipkebm': {
      'en':
          'Enter your new password and we will change it for you. Remember to note it down somewhere so you don\'t forget this time! :)',
      'ar':
          'لا مشكلة! فضلًا ادخل بريدك الإلكتروني المرتبط بحسابك ، وسوف نرسل لك بريد لتغيير كلمة المرور.',
    },
    'hutmee47': {
      'en': 'Your new password',
      'ar': 'كلمة المرور الجديدة',
    },
    'jmb1bzln': {
      'en': 'Enter your new password...',
      'ar': 'ادخل كلمة المرور الجديدة...',
    },
    'prd0r8ky': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    'rjzyfb91': {
      'en': 'Home ',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // thankYou
  {
    '4kbopxi2': {
      'en': 'Thank You!',
      'ar': 'شكرًا لك!',
    },
    '1cw5fnme': {
      'en':
          'Your tickets will be available on \'My Tickets Page\' from the menu bar',
      'ar': 'تذاكرك متوفرة الان في صفحة تذاكري من القائمة الرئيسية',
    },
    'srgvgd7d': {
      'en': 'My Tickets',
      'ar': 'تذاكري',
    },
    'yi2tqx8k': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // all
  {
    '7mb1q8wk': {
      'en': 'Train Lines Map',
      'ar': 'خريطة مسارات القطارات',
    },
    'ixciqc2u': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Yellow
  {
    'yf7w89lw': {
      'en': '4 - Yellow Line',
      'ar': '٤- المسار الأصفر',
    },
    '2xuqv9oo': {
      'en': 'Terminal 1-2 | صالة ١-٢',
      'ar': 'Terminal 1-2 | صالة ١-٢',
    },
    '6yf8ftvl': {
      'en': 'Terminal 3-4 | صالة ٣-٤',
      'ar': 'Terminal 3-4 | صالة ٣-٤',
    },
    'o12jtd3f': {
      'en': 'Terminal 5 | صالة ٥',
      'ar': 'Terminal 5 | صالة ٥',
    },
    '2m7iqmiu': {
      'en': 'Princess Nora Uni 2 | جامعة الأميرة نورة ٢',
      'ar': 'Princess Nora Uni 2 | جامعة الأميرة نورة ٢',
    },
    'kaytdos8': {
      'en': 'Princess Nora Uni 1 | جامعة الأميرة نورة ١',
      'ar': 'Princess Nora Uni 1 | جامعة الأميرة نورة ١',
    },
    '5tzq46na': {
      'en': 'SABIC | سابك ',
      'ar': 'SABIC | سابك ',
    },
    '54o18w2x': {
      'en': 'Uthman bin Afan Rd | طريق عثمان بن عفان ',
      'ar': 'Uthman bin Afan Rd | طريق عثمان بن عفان ',
    },
    'k6csulff': {
      'en': 'Ar Rabi | الربيع ',
      'ar': 'Ar Rabi | الربيع ',
    },
    'v3qrjqlu': {
      'en': 'KAFD | المركز المالي ',
      'ar': 'KAFD | المركز المالي ',
    },
    '0oi0yw3j': {
      'en': 'Home',
      'ar': '',
    },
  },
  // notification
  {
    '6zejs0t5': {
      'en': 'Train Stations',
      'ar': 'محطات القطار',
    },
    '1bfy2lc8': {
      'en': 'Buy Tickets',
      'ar': 'شراء تذاكر ',
    },
    'c1rdcn42': {
      'en': 'My Tickets',
      'ar': 'تذاكري ',
    },
    'abclckil': {
      'en': 'Notification',
      'ar': 'الإشعارات',
    },
    'pjvr2ble': {
      'en': 'Account',
      'ar': 'الحساب',
    },
    'panvpumt': {
      'en': 'Notification center',
      'ar': 'مركز الإشعارات',
    },
    'kssb8s9d': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Purple
  {
    'l9x2of70': {
      'en': '6 - Purple Line',
      'ar': '٦- المسار البنفسجي',
    },
    'u7339gye': {
      'en': 'An Naseem | النسيم',
      'ar': 'An Naseem | النسيم',
    },
    'oecm3jwa': {
      'en': 'As Salam | السلام',
      'ar': 'As Salam | السلام',
    },
    'pqbkxm0v': {
      'en': 'Khurais Rd | طريق خريص',
      'ar': 'Khurais Rd | طريق خريص',
    },
    '11lgnxz0': {
      'en': 'Al Hamra | الحمراء',
      'ar': 'Al Hamra | الحمراء',
    },
    'czjn3e0c': {
      'en': 'Al Yarmuk | اليرموك',
      'ar': 'Al Yarmuk | اليرموك',
    },
    'oafyd2go': {
      'en': 'Garnadia | غرناطيّة',
      'ar': 'Garnadia | غرناطيّة',
    },
    'idihy5gm': {
      'en': 'SABIC | سابك',
      'ar': 'SABIC | سابك',
    },
    'qizukcds': {
      'en': 'Uthman bin Afan Rd | طريق عثمان بن عفان ',
      'ar': 'Uthman bin Afan Rd | طريق عثمان بن عفان ',
    },
    'sibob9kk': {
      'en': 'Ar Rabi | الربيع ',
      'ar': 'Ar Rabi | الربيع ',
    },
    'iuiy3nbe': {
      'en': 'KAFD | المركز المالي ',
      'ar': 'KAFD | المركز المالي ',
    },
    '9djcpwmm': {
      'en': 'Home',
      'ar': '',
    },
  },
  // red
  {
    '41k20hbf': {
      'en': '2 - Red Line',
      'ar': '٢- المسار الأحمر',
    },
    'snkm5l9q': {
      'en': 'King Fahad Sport City |مدينة الملك فهد الرياضيه ',
      'ar': 'King Fahad Sport City |مدينة الملك فهد الرياضيه ',
    },
    'vjhoqpvb': {
      'en': 'Ishbiliyah | اشبيليا',
      'ar': 'Ishbiliyah | اشبيليا',
    },
    'f3z4e94v': {
      'en': 'Al khaleej | الخليج',
      'ar': 'Al khaleej | الخليج',
    },
    'fytzct40': {
      'en': 'Al Hamra | الحمراء ',
      'ar': 'Al Hamra | الحمراء ',
    },
    'mvp42ktr': {
      'en': 'Riyadh Exhibition Center | مركز الرياض للمعارض ',
      'ar': 'Riyadh Exhibition Center | مركز الرياض للمعارض ',
    },
    'ylvlwq9p': {
      'en': 'Al Nuzhah | النزهه',
      'ar': 'Al Nuzhah | النزهه',
    },
    'qhxptyc5': {
      'en': 'Ministry of Education | وزارة التعليم',
      'ar': 'Ministry of Education | وزارة التعليم',
    },
    '9tiw44ha': {
      'en': 'King Abdulaziz Road | طريق الملك عبدالعزيز',
      'ar': 'King Abdulaziz Road | طريق الملك عبدالعزيز',
    },
    'wypbv95i': {
      'en': 'Al Wurud | الورود',
      'ar': 'Al Wurud | الورود',
    },
    'hpuzadzi': {
      'en': 'STC',
      'ar': 'STC',
    },
    '3p10k6mu': {
      'en': 'At Takhassussi | التخصصي',
      'ar': 'At Takhassussi | التخصصي',
    },
    'yxzxrvne': {
      'en': 'KACST | المدينة الرقمية',
      'ar': 'KACST | المدينة الرقمية',
    },
    'uotz9tgv': {
      'en': 'King Salman Oasis | واحة الملك سلمان',
      'ar': 'King Salman Oasis | واحة الملك سلمان',
    },
    '9sf4ebtd': {
      'en': 'King Saud University | جامعة الملك سعود',
      'ar': 'King Saud University | جامعة الملك سعود',
    },
    'pkpyksdm': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Orange
  {
    'n3zi5x7g': {
      'en': '3 - Orange Line',
      'ar': '٣- المسار البرتقالي ',
    },
    'pu66zeqi': {
      'en': ' Jeedah | جِـــــــدة',
      'ar': ' Jeedah | جِـــــــدة',
    },
    'xplmj3tx': {
      'en': 'Tuwiq | طويـــق',
      'ar': 'Tuwiq | طويـــق',
    },
    'rb9zx9e6': {
      'en': 'Ad Douh | الــدوح',
      'ar': 'Ad Douh | الــدوح',
    },
    'kdr7buyp': {
      'en': 'Dhahrat Al Badiah| ظهرة البديعة',
      'ar': 'Dhahrat Al Badiah| ظهرة البديعة',
    },
    'lcbrrass': {
      'en': 'Sultanah | الجراديـــة',
      'ar': 'Sultanah | الجراديـــة',
    },
    '9pgw1pbu': {
      'en': 'Al Hilla| الـحلــة',
      'ar': 'Al Hilla| الـحلــة',
    },
    'mf3p9iae': {
      'en': 'First Industrial City | المدينة الصناعية الأولى',
      'ar': 'First Industrial City | المدينة الصناعية الأولى',
    },
    'ne2o8vp0': {
      'en': 'Harun Ar Rashid Rd. | طريق هارون الرشيد ',
      'ar': 'Harun Ar Rashid Rd. | طريق هارون الرشيد ',
    },
    'u7wpx7sc': {
      'en': ' An Naseem | النســيـم',
      'ar': ' An Naseem | النســيـم',
    },
    '54igd0tt': {
      'en': 'Home',
      'ar': '',
    },
  },
  // green
  {
    'oqcimf6m': {
      'en': '5 - Green Line',
      'ar': '٥- المسار الاخضر',
    },
    'udvbwzvz': {
      'en': 'وزاره التعليم | Ministry of Education',
      'ar': 'وزاره التعليم | Ministry of Education',
    },
    'ar9q4wxi': {
      'en': 'حديقة الملك سلمان | King Salman Park',
      'ar': 'حديقة الملك سلمان | King Salman Park',
    },
    'q8ufysfn': {
      'en': 'السليمانية| As Sulimsniyah',
      'ar': 'السليمانية| As Sulimsniyah',
    },
    'bu44bsf2': {
      'en': 'الضباب | Ad Dhabab',
      'ar': 'الضباب | Ad Dhabab',
    },
    '0h8s79ku': {
      'en': 'ميدان أبو ظبي |Abu Dhabi square',
      'ar': 'ميدان أبو ظبي |Abu Dhabi square',
    },
    '8nlin7h1': {
      'en': 'نادي الضباط | Offcers Club',
      'ar': 'نادي الضباط | Offcers Club',
    },
    'ciffzea9': {
      'en': 'التأمينات الاجتماعية | GOSI',
      'ar': 'التأمينات الاجتماعية | GOSI',
    },
    'ihrjwchs': {
      'en': 'الوزارات | Al Wzarat',
      'ar': 'الوزارات | Al Wzarat',
    },
    'bzwv7r0t': {
      'en': 'وزارة الدفاع | MDDA',
      'ar': 'وزارة الدفاع | MDDA',
    },
    'xrl4lzw5': {
      'en': 'مستشفى الملك عبدالعزيز |King Abdulaziz Hos..',
      'ar': 'مستشفى الملك عبدالعزيز |King Abdulaziz Hos..',
    },
    '6k0jslcl': {
      'en': 'وزارة المالية |MOF',
      'ar': 'وزارة المالية |MOF',
    },
    'c7g9522y': {
      'en': 'المتحف الوطني| National Museum',
      'ar': 'المتحف الوطني| National Museum',
    },
    'a7g62780': {
      'en': 'Home',
      'ar': '',
    },
  },
  // blue
  {
    '9t1mewu2': {
      'en': '1 - Blue Line',
      'ar': '١- المسار الأزرق ',
    },
    'f7kgx8ah': {
      'en': 'Ad Dar Al Baida | الدار البيضاء',
      'ar': 'Ad Dar Al Baida | الدار البيضاء',
    },
    'g0276b1c': {
      'en': 'Al Azizah | العزيزية',
      'ar': 'Al Azizah | العزيزية',
    },
    'phk7vfcg': {
      'en': 'Transportation Center | مركز النقل العام',
      'ar': 'Transportation Center | مركز النقل العام',
    },
    'u9mn4mev': {
      'en': 'Al Iman Hospital | مستشفى الإيمان',
      'ar': 'Al Iman Hospital | مستشفى الإيمان',
    },
    'aa6f45zo': {
      'en': 'Manfouhah | منفوحة',
      'ar': 'Manfouhah | منفوحة',
    },
    'x3w3xab2': {
      'en': 'Skirinah | سكيرينة',
      'ar': 'Skirinah | سكيرينة',
    },
    'qetxno6b': {
      'en': 'Al Oud | العود',
      'ar': 'Al Oud | العود',
    },
    'r0a3h5er': {
      'en': 'Al Bat\'ha | البطحاء',
      'ar': 'Al Bat\'ha | البطحاء',
    },
    'tsldc4kb': {
      'en': 'National Museum | المتحف الوطني',
      'ar': 'National Museum | المتحف الوطني',
    },
    'icvkdfx3': {
      'en': 'Passport Department | الجوازات',
      'ar': 'Passport Department | الجوازات',
    },
    '8dkkk03x': {
      'en': 'Al Muorabba | المربع',
      'ar': 'Al Muorabba | المربع',
    },
    'mguoio2a': {
      'en': 'Ministry of Interior | وزارة الداخلية',
      'ar': 'Ministry of Interior | وزارة الداخلية',
    },
    'v40pccpd': {
      'en': 'King Fahad Library | مكتبة الملك فهد',
      'ar': 'King Fahad Library | مكتبة الملك فهد',
    },
    'tpnyqbfh': {
      'en': 'Banak Albilad | بنك البلاد',
      'ar': 'Banak Albilad | بنك البلاد',
    },
    'h9knne9o': {
      'en': 'Alinma Bank | مصرف الإنماء',
      'ar': 'Alinma Bank | مصرف الإنماء',
    },
    'addgfxvn': {
      'en': 'Al Urubah | العروبة',
      'ar': 'Al Urubah | العروبة',
    },
    'h7mhdpzn': {
      'en': 'Al Wurud 2 | الورود ٢',
      'ar': 'Al Wurud 2 | الورود ٢',
    },
    '3fp5ygm5': {
      'en': 'STC | STC',
      'ar': 'STC | STC',
    },
    'ui0o1dpx': {
      'en': 'King Fahad District  2 | حي الملك فهد ٢',
      'ar': 'King Fahad District  2 | حي الملك فهد ٢',
    },
    'g0euhq9o': {
      'en': 'King Fahad District  | حي الملك فهد ',
      'ar': 'King Fahad District  | حي الملك فهد ',
    },
    'a2g5fkyx': {
      'en': 'Al Murooj | المروج',
      'ar': 'Al Murooj | المروج',
    },
    't09yvee7': {
      'en': 'KAFD | المركز المالي',
      'ar': 'KAFD | المركز المالي',
    },
    '31kt7fwf': {
      'en': 'DR. SULAMIMN ALHABIB | د. سليمان الحبيب',
      'ar': 'DR. SULAMIMN ALHABIB | د. سليمان الحبيب',
    },
    'wafzzi0l': {
      'en': 'SAB | بنك الأول',
      'ar': 'SAB | بنك الأول',
    },
    'io4gtxpg': {
      'en': 'Home',
      'ar': '',
    },
  },
  // myTicketsDetails
  {
    'dhnpo01u': {
      'en': 'Ticket Details',
      'ar': 'تفاصيل التذكرة',
    },
    'fu5ts2fg': {
      'en': 'WAJEEZ',
      'ar': 'وجيز',
    },
    'b7b0jrym': {
      'en': 'Ticket ID:',
      'ar': 'معرف التذكرة:',
    },
    '3j2bpmqc': {
      'en': 'the ticket will expire automatically after ',
      'ar': 'سيتم انتهاء صلاحية التذكرة تلقائيًا بعد',
    },
    'ovb5n601': {
      'en': 'Transfer ticket?',
      'ar': 'إرسال تذكرة؟',
    },
    'y2sdiewy': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // transferTicket
  {
    'y67sdzoi': {
      'en': 'Back',
      'ar': 'خلف',
    },
    'bb0h5sml': {
      'en': 'Transfer Ticket',
      'ar': 'إرسال تذكرة',
    },
    'n5pln7vn': {
      'en':
          'Enter the email address linked to the recipient’s account, and we’ll verify it.',
      'ar':
          'أدخل عنوان البريد الإلكتروني المرتبط بحساب المستلم، وسوف نقوم بالتحقق منه.',
    },
    '5htq0bwj': {
      'en': 'email address...',
      'ar': 'عنوان بريدك  الإلكتروني...',
    },
    '3fk6gugo': {
      'en': 'Enter recipeint\'s email...',
      'ar': 'أدخل بريدك الإلكتروني...',
    },
    'bh0i6kf9': {
      'en': 'Your email address... is required',
      'ar': 'عنوان بريدك الإلكتروني... مطلوب',
    },
    'ralq56om': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة ادناه',
    },
    '84qu9jgw': {
      'en': 'Next',
      'ar': 'التالي',
    },
    'yqny4t0e': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // FAQ
  {
    'y5w6jgr0': {
      'en': 'FAQ',
      'ar': 'الاسئلة الشائعة',
    },
    'm6at694k': {
      'en': 'What are the ways to contact customer service?',
      'ar': 'ما هي طرق التواصل مع خدمة العملاء؟',
    },
    'ofnr0fv0': {
      'en':
          'Email:wajeez2025@gmail.com\nIn-Person: Visit the customer service desk at any station.\n\n\n',
      'ar':
          'البريد الإلكتروني: wajeez2025@gmail.com\nشخصيًا: قم بزيارة مكتب خدمة العملاء في أي محطة.',
    },
    'lkdmlad0': {
      'en':
          'What should I do if I face issues booking tickets through the app?',
      'ar': 'ماذا أفعل إذا واجهت مشكلات في حجز التذاكر عبر التطبيق؟',
    },
    'o4yzh2wa': {
      'en':
          'Check your internet connection to ensure it’s stable.\nRestart the app and try again.\nIf the issue persists, contact customer service for assistance.',
      'ar':
          'تحقق من اتصال الإنترنت للتأكد من أنه مستقر.\nأعد تشغيل التطبيق وحاول مرة أخرى.\nإذا استمرت المشكلة، تواصل مع خدمة العملاء للحصول على المساعدة.\n',
    },
    'mk11qi7e': {
      'en':
          'What are the safety procedures and protocols followed by Riyadh Metro to ensure passenger security?',
      'ar':
          'ما هي إجراءات وأنظمة السلامة التي يتبعها مترو الرياض لضمان أمن الركاب؟\n',
    },
    'u3tqnv4q': {
      'en':
          'Riyadh Metro implements a range of safety measures to ensure passenger security. Surveillance cameras are installed throughout public transport locations in Riyadh, including stations, trains, buses, and all facilities. Security personnel are strategically positioned at all stations to monitor crowds and maintain a safe environment. They also serve as points of contact for passengers, aiming to enhance overall safety and provide comfort and security for all riders.',
      'ar':
          'يتبع مترو الرياض مجموعة من إجراءات السلامة لضمان أمن الركاب. تم تركيب كاميرات مراقبة في جميع مواقع النقل العام في الرياض، بما في ذلك المحطات، والقطارات، والحافلات، وجميع المرافق. كما يتم توزيع أفراد الأمن بشكل استراتيجي في جميع المحطات لمراقبة الحشود والحفاظ على بيئة آمنة. بالإضافة إلى ذلك، يُعدّ أفراد الأمن نقاط اتصال للركاب، بهدف تعزيز السلامة العامة وتوفير الراحة والأمان لجميع المسافرين.\n',
    },
    'rlf2u9u8': {
      'en':
          'What should I do if I miss the last train of the day on Riyadh Metro?',
      'ar': 'ماذا يجب أن أفعل إذا فاتني آخر قطار في اليوم على مترو الرياض؟\n',
    },
    'rhp0bkah': {
      'en':
          'Riyadh Metro implements a range of safety measures to ensure passenger security. Surveillance cameras are installed throughout public transport locations in Riyadh, including stations, trains, buses, and all facilities. Security personnel are strategically positioned at all stations to monitor crowds and maintain a safe environment. They also serve as points of contact for passengers, aiming to enhance overall safety and provide comfort and security for all riders.',
      'ar':
          'يتبع مترو الرياض مجموعة من إجراءات السلامة لضمان أمن الركاب. يتم تركيب كاميرات مراقبة في جميع مواقع النقل العام في الرياض، بما في ذلك المحطات، والقطارات، والحافلات، وجميع المرافق. يتمركز أفراد الأمن بشكل استراتيجي في جميع المحطات لمراقبة الحشود والحفاظ على بيئة آمنة. كما يعملون كنقاط اتصال للركاب بهدف تعزيز السلامة العامة وتوفير الراحة والأمان لجميع المسافرين.',
    },
    'tzhspjun': {
      'en':
          'Where can I submit a complaint, provide feedback, or report an issue regarding my experience with Riyadh Metro?',
      'ar':
          'أين يمكنني تقديم شكوى أو تقديم ملاحظات أو الإبلاغ عن مشكلة تتعلق بتجربتي مع مترو الرياض؟',
    },
    'yoqwl8hs': {
      'en':
          'You can send an email to wajeez2025@gmail.com to share your complaint, feedback, or report an issue.',
      'ar':
          'يمكنك إرسال بريد إلكتروني إلى wajeez2025@gmail.com لتقديم شكوى أو ملاحظات أو للإبلاغ عن مشكلة.',
    },
    'ea320j02': {
      'en': 'Who can I contact if I forgot or lost something on the train?',
      'ar': 'من يمكنني التواصل معه إذا نسيت أو فقدت شيئًا في القطار؟\n',
    },
    '10ha1pw8': {
      'en':
          'You can contact the Customer Service Center via Account >> Support >>  send a message.',
      'ar':
          'يمكنك التواصل مع مركز خدمة العملاء عبر الحساب >> الدعم >> إرسال رسالة.',
    },
    'x6yxt3tw': {
      'en':
          'Can I reuse the same ticket if I leave the station for a short time?',
      'ar': 'هل يمكنني إعادة استخدام نفس التذكرة إذا غادرت المحطة لفترة قصيرة؟',
    },
    'sl8wpck0': {
      'en':
          'Passengers are allowed to enter and exit through the gates as long as they hold a valid ticket.',
      'ar':
          'يُسمح للركاب بالدخول والخروج عبر البوابات طالما أنهم يحملون تذكرة صالحة.',
    },
    '1nc18luf': {
      'en': 'What is the train schedule?',
      'ar': 'ما هو جدول مواعيد القطار؟',
    },
    'dcwcfq7j': {
      'en':
          'During peak hours, trains arrive every 3 to 5 minutes, depending on the line. Outside peak hours, intervals range from 5 to 10 minutes.',
      'ar':
          'أثناء ساعات الذروة، تصل القطارات كل 3 إلى 5 دقائق حسب الخط. خارج ساعات الذروة، تتراوح الفواصل الزمنية بين 5 إلى 10 دقائق.',
    },
    'hwkulour': {
      'en': 'What are the operating hours of Riyadh Metro?',
      'ar': 'ما هي ساعات تشغيل مترو الرياض؟',
    },
    '61yhr1ew': {
      'en': 'Daily from 6:00 AM to 12:00 Midnight.\n\n\n\n',
      'ar': 'يوميًا من الساعة 6:00 صباحًا حتى 12:00 منتصف الليل.',
    },
    'qaqn32ge': {
      'en':
          'Can I request a refund if I miss my train or decide not to use it?',
      'ar':
          'هل يمكنني طلب استرداد الأموال إذا فاتني القطار أو قررت عدم استخدامه؟',
    },
    'tl0wi25u': {
      'en': 'No. Once a ticket is purchased, refunds are not available.',
      'ar': 'لا، بمجرد شراء التذكرة، لا يمكن استرداد الأموال.',
    },
    '3vpionjc': {
      'en': 'Are there seasonal offers or discounts on tickets?',
      'ar': 'هل توجد عروض موسمية أو خصومات على التذاكر؟',
    },
    'ul2vbka4': {
      'en':
          'Yes, seasonal offers and discounts are occasionally available. You can check for active promotions from the home screen.\n\n\n',
      'ar':
          'نعم، تتوفر عروض موسمية وخصومات أحيانًا. يمكنك التحقق من العروض النشطة من الشاشة الرئيسية.',
    },
    'vhi8fgfn': {
      'en': 'Where can I buy my ticket?',
      'ar': 'أين يمكنني شراء تذكرتي؟',
    },
    '8kwbknme': {
      'en':
          'Tickets can be purchased from any Ticket Vending Machine (TVM) or ticket counter at all train stations, as well as through the Wajeez application.',
      'ar':
          'يمكن شراء التذاكر من أي جهاز بيع التذاكر (TVM) أو من شباك التذاكر في جميع محطات القطار، بالإضافة إلى تطبيق وجيز.',
    },
    '55p6yrg4': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // liveChat
  {
    'r56l1u47': {
      'en': 'Send a Message',
      'ar': 'الدردشة الحيه',
    },
    '1jhnjjsm': {
      'en': '',
      'ar': '',
    },
    'a3gtzkn5': {
      'en': 'Message type...',
      'ar': '',
    },
    'relqw9bc': {
      'en': 'Search...',
      'ar': '',
    },
    '3tqi03gw': {
      'en': 'submit a complaint',
      'ar': '',
    },
    's9ezs0g7': {
      'en': 'suggest',
      'ar': '',
    },
    's24y7gfz': {
      'en': 'ticket issue',
      'ar': '',
    },
    'sdsyerkf': {
      'en': 'Title',
      'ar': '',
    },
    'pmcy3qx6': {
      'en': 'title..',
      'ar': '',
    },
    'mw41s9ga': {
      'en': 'message',
      'ar': '',
    },
    '0o1ilv8n': {
      'en': 'type your messae here..',
      'ar': '',
    },
    'azg710tp': {
      'en': 'Title is required',
      'ar': '',
    },
    'oyty20f3': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'اختر خيار من القائمة.',
    },
    'qe7pxh46': {
      'en': 'message is required',
      'ar': '',
    },
    'opfvppwu': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'gcgmwyn0': {
      'en': 'submit',
      'ar': '',
    },
    'cj9wiebn': {
      'en': 'Home Page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Miscellaneous
  {
    'bs4kqsva': {
      'en': 'Hint Text ...',
      'ar': '',
    },
    'wim4fcj5': {
      'en': 'Hint Text ...',
      'ar': '',
    },
    '0ffsobvb': {
      'en': 'Button Title',
      'ar': '',
    },
    'ffgmf72c': {
      'en': 'Heading',
      'ar': '',
    },
    'piql97er': {
      'en': 'NOT STARTED',
      'ar': '',
    },
    '8aqv0puu': {
      'en': 'NOT STARTED',
      'ar': '',
    },
    'xs5nqjhj': {
      'en': 'IN PROGRESS',
      'ar': '',
    },
    'psx3uk92': {
      'en': 'COMPLETED',
      'ar': '',
    },
    'ikrslqkh': {
      'en': 'Please select ...',
      'ar': '',
    },
    'uvlosvr3': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'lmltev33': {
      'en': 'Body Text',
      'ar': '',
    },
    'iqr9s2nc': {
      'en': '',
      'ar': '',
    },
    'iqwzpavm': {
      'en': '',
      'ar': '',
    },
    '6dh1596k': {
      'en': '',
      'ar': '',
    },
    '961c3pmv': {
      'en': '',
      'ar': '',
    },
    'flowiabq': {
      'en': '',
      'ar': '',
    },
    'gudptgfy': {
      'en': '',
      'ar': '',
    },
    '79bgl6cn': {
      'en': '',
      'ar': '',
    },
    'mw41bp8k': {
      'en': '',
      'ar': '',
    },
    'zdqvx5h6': {
      'en': '',
      'ar': '',
    },
    '5tzlv03q': {
      'en': '',
      'ar': '',
    },
    '0fedxvw1': {
      'en': '',
      'ar': '',
    },
    '8f5k9lk9': {
      'en': '',
      'ar': '',
    },
    '0obr07bh': {
      'en': '',
      'ar': '',
    },
    't6v6gpl7': {
      'en': '',
      'ar': '',
    },
    'rpmvohje': {
      'en': '',
      'ar': '',
    },
    '2zf0cajw': {
      'en': '',
      'ar': '',
    },
    'hl74hne8': {
      'en': '',
      'ar': '',
    },
    'fnub7s2o': {
      'en': '',
      'ar': '',
    },
    '7h4it1z5': {
      'en': '',
      'ar': '',
    },
    '2izor0s6': {
      'en': '',
      'ar': '',
    },
    'whp3k18q': {
      'en': '',
      'ar': '',
    },
    'xd7vuz3f': {
      'en': '',
      'ar': '',
    },
    '4lydv7yr': {
      'en': '',
      'ar': '',
    },
    '76ib7975': {
      'en': '',
      'ar': '',
    },
    'krix2wgk': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));

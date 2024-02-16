// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `BNS 360`
  String get appName {
    return Intl.message(
      'BNS 360',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Welcome,`
  String get welcome {
    return Intl.message(
      'Welcome,',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Continue as Guest`
  String get continueAsGuest {
    return Intl.message(
      'Continue as Guest',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back to Login to your Account`
  String get loginMsg {
    return Intl.message(
      'Welcome back to Login to your Account',
      name: 'loginMsg',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get notHaveAccountMsg {
    return Intl.message(
      'Don\'t have an account?',
      name: 'notHaveAccountMsg',
      desc: '',
      args: [],
    );
  }

  /// `Field is required`
  String get validateEmpty {
    return Intl.message(
      'Field is required',
      name: 'validateEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address`
  String get validateEmail {
    return Intl.message(
      'Enter a valid email address',
      name: 'validateEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get validatePassword {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'validatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter at least two names (first and last).`
  String get validateTwoNames {
    return Intl.message(
      'Please enter at least two names (first and last).',
      name: 'validateTwoNames',
      desc: '',
      args: [],
    );
  }

  /// `Invalid name format. Use English or Arabic letters only.`
  String get validateInvalidNameFormat {
    return Intl.message(
      'Invalid name format. Use English or Arabic letters only.',
      name: 'validateInvalidNameFormat',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get validatePhone {
    return Intl.message(
      'Invalid phone number',
      name: 'validatePhone',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterName {
    return Intl.message(
      'Enter your name',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get haveAccountMsg {
    return Intl.message(
      'Already have an account?',
      name: 'haveAccountMsg',
      desc: '',
      args: [],
    );
  }

  /// `Create your Account`
  String get createYourAccount {
    return Intl.message(
      'Create your Account',
      name: 'createYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Fill your information below or register with your social account`
  String get signUpMsg {
    return Intl.message(
      'Fill your information below or register with your social account',
      name: 'signUpMsg',
      desc: '',
      args: [],
    );
  }

  /// `Please choose`
  String get pleaseChoose {
    return Intl.message(
      'Please choose',
      name: 'pleaseChoose',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Optional`
  String get optional {
    return Intl.message(
      'Optional',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Service provider`
  String get serviceProvider {
    return Intl.message(
      'Service provider',
      name: 'serviceProvider',
      desc: '',
      args: [],
    );
  }

  /// `Business owner`
  String get businessOwner {
    return Intl.message(
      'Business owner',
      name: 'businessOwner',
      desc: '',
      args: [],
    );
  }

  /// `Send code`
  String get sendCode {
    return Intl.message(
      'Send code',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `Don’t worry! It happens. Please enter the email associated with your account.`
  String get forgotPasswordMsg {
    return Intl.message(
      'Don’t worry! It happens. Please enter the email associated with your account.',
      name: 'forgotPasswordMsg',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email`
  String get checkEmailMsg {
    return Intl.message(
      'Please check your email',
      name: 'checkEmailMsg',
      desc: '',
      args: [],
    );
  }

  /// `We’ve sent a code to`
  String get sentCodeTo {
    return Intl.message(
      'We’ve sent a code to',
      name: 'sentCodeTo',
      desc: '',
      args: [],
    );
  }

  /// `I didn't receive a code!`
  String get notReceiveCode {
    return Intl.message(
      'I didn\'t receive a code!',
      name: 'notReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please type something you’ll remember`
  String get resetPasswordMsg {
    return Intl.message(
      'Please type something you’ll remember',
      name: 'resetPasswordMsg',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get enterNewPassword {
    return Intl.message(
      'Enter new password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm new password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password changed`
  String get passwordChanged {
    return Intl.message(
      'Password changed',
      name: 'passwordChanged',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed successfully`
  String get passwordChangedMsg {
    return Intl.message(
      'Your password has been changed successfully',
      name: 'passwordChangedMsg',
      desc: '',
      args: [],
    );
  }

  /// `Back to log in`
  String get backToLogin {
    return Intl.message(
      'Back to log in',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Places to explore`
  String get places_to_explore {
    return Intl.message(
      'Places to explore',
      name: 'places_to_explore',
      desc: '',
      args: [],
    );
  }

  /// `No places to explore`
  String get no_places_to_explore {
    return Intl.message(
      'No places to explore',
      name: 'no_places_to_explore',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Craftsmen`
  String get craftsmen {
    return Intl.message(
      'Craftsmen',
      name: 'craftsmen',
      desc: '',
      args: [],
    );
  }

  /// `Craftsman`
  String get craftsman {
    return Intl.message(
      'Craftsman',
      name: 'craftsman',
      desc: '',
      args: [],
    );
  }

  /// `No favorite items!`
  String get no_favorite_items {
    return Intl.message(
      'No favorite items!',
      name: 'no_favorite_items',
      desc: '',
      args: [],
    );
  }

  /// `No craftsmen found!`
  String get no_craftsmen_found {
    return Intl.message(
      'No craftsmen found!',
      name: 'no_craftsmen_found',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_password {
    return Intl.message(
      'Change password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get dark_mode {
    return Intl.message(
      'Dark mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Terms of service`
  String get terms_of_service {
    return Intl.message(
      'Terms of service',
      name: 'terms_of_service',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about_us {
    return Intl.message(
      'About Us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `App settings`
  String get app_settings {
    return Intl.message(
      'App settings',
      name: 'app_settings',
      desc: '',
      args: [],
    );
  }

  /// `Search on`
  String get search_on {
    return Intl.message(
      'Search on',
      name: 'search_on',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get user_name {
    return Intl.message(
      'User Name',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get change_language {
    return Intl.message(
      'Change language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Open now`
  String get open_now {
    return Intl.message(
      'Open now',
      name: 'open_now',
      desc: '',
      args: [],
    );
  }

  /// `Closed now`
  String get closed_now {
    return Intl.message(
      'Closed now',
      name: 'closed_now',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `AM`
  String get am {
    return Intl.message(
      'AM',
      name: 'am',
      desc: '',
      args: [],
    );
  }

  /// `PM`
  String get pm {
    return Intl.message(
      'PM',
      name: 'pm',
      desc: '',
      args: [],
    );
  }

  /// `Review summary`
  String get review_summary {
    return Intl.message(
      'Review summary',
      name: 'review_summary',
      desc: '',
      args: [],
    );
  }

  /// `View reviews`
  String get view_reviews {
    return Intl.message(
      'View reviews',
      name: 'view_reviews',
      desc: '',
      args: [],
    );
  }

  /// `Reviewer`
  String get reviewer {
    return Intl.message(
      'Reviewer',
      name: 'reviewer',
      desc: '',
      args: [],
    );
  }

  /// `write a Review`
  String get write_review {
    return Intl.message(
      'write a Review',
      name: 'write_review',
      desc: '',
      args: [],
    );
  }

  /// `Tap to Rate`
  String get tap_to_rate {
    return Intl.message(
      'Tap to Rate',
      name: 'tap_to_rate',
      desc: '',
      args: [],
    );
  }

  /// `Write your review`
  String get write_your_review {
    return Intl.message(
      'Write your review',
      name: 'write_your_review',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `day ago`
  String get day_ago {
    return Intl.message(
      'day ago',
      name: 'day_ago',
      desc: '',
      args: [],
    );
  }

  /// `hour ago`
  String get hour_ago {
    return Intl.message(
      'hour ago',
      name: 'hour_ago',
      desc: '',
      args: [],
    );
  }

  /// `min ago`
  String get min_ago {
    return Intl.message(
      'min ago',
      name: 'min_ago',
      desc: '',
      args: [],
    );
  }

  /// `Just now`
  String get just_now {
    return Intl.message(
      'Just now',
      name: 'just_now',
      desc: '',
      args: [],
    );
  }

  /// `{days} days ago`
  String days_ago(Object days) {
    return Intl.message(
      '$days days ago',
      name: 'days_ago',
      desc: '',
      args: [days],
    );
  }

  /// `{hours} hours ago`
  String hours_ago(Object hours) {
    return Intl.message(
      '$hours hours ago',
      name: 'hours_ago',
      desc: '',
      args: [hours],
    );
  }

  /// `{mins} mins ago`
  String mins_ago(Object mins) {
    return Intl.message(
      '$mins mins ago',
      name: 'mins_ago',
      desc: '',
      args: [mins],
    );
  }

  /// `Places`
  String get places {
    return Intl.message(
      'Places',
      name: 'places',
      desc: '',
      args: [],
    );
  }

  /// `We need access to your location to enhance services and calculate distances between places you view.`
  String get access_location_permission_msg {
    return Intl.message(
      'We need access to your location to enhance services and calculate distances between places you view.',
      name: 'access_location_permission_msg',
      desc: '',
      args: [],
    );
  }

  /// `To pick images for your business or work, please grant camera permission in settings.`
  String get access_camera_permissions_msg {
    return Intl.message(
      'To pick images for your business or work, please grant camera permission in settings.',
      name: 'access_camera_permissions_msg',
      desc: '',
      args: [],
    );
  }

  /// `To upload images for your business or work, please grant storage permission in settings.`
  String get access_storage_permissions_msg {
    return Intl.message(
      'To upload images for your business or work, please grant storage permission in settings.',
      name: 'access_storage_permissions_msg',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Permission Denied`
  String get permission_denied {
    return Intl.message(
      'Permission Denied',
      name: 'permission_denied',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

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

  /// `Don''t have an account?`
  String get notHaveAccountMsg {
    return Intl.message(
      'Don\'\'t have an account?',
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

  /// `I didn''t receive a code!`
  String get notReceiveCode {
    return Intl.message(
      'I didn\'\'t receive a code!',
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

  /// `Old password`
  String get oldPassword {
    return Intl.message(
      'Old password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter old password`
  String get enterOldPassword {
    return Intl.message(
      'Enter old password',
      name: 'enterOldPassword',
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

  /// `Failed to change password`
  String get failedToChangePassword {
    return Intl.message(
      'Failed to change password',
      name: 'failedToChangePassword',
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

  /// `There are no messages yet`
  String get there_are_no_messages_yet {
    return Intl.message(
      'There are no messages yet',
      name: 'there_are_no_messages_yet',
      desc: '',
      args: [],
    );
  }

  /// `Write your message`
  String get write_your_message {
    return Intl.message(
      'Write your message',
      name: 'write_your_message',
      desc: '',
      args: [],
    );
  }

  /// `The image size is too large, the maximum allowed size is`
  String get the_image_size_is_too_large_the_maximum_allowed_size_is_mp {
    return Intl.message(
      'The image size is too large, the maximum allowed size is',
      name: 'the_image_size_is_too_large_the_maximum_allowed_size_is_mp',
      desc: '',
      args: [],
    );
  }

  /// `Password must be more than the minimum length of characters`
  String get must_be_more_than_minimum_number_of_characters {
    return Intl.message(
      'Password must be more than the minimum length of characters',
      name: 'must_be_more_than_minimum_number_of_characters',
      desc: '',
      args: [],
    );
  }

  /// `Conversations`
  String get conversations {
    return Intl.message(
      'Conversations',
      name: 'conversations',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get no_results {
    return Intl.message(
      'No results found',
      name: 'no_results',
      desc: '',
      args: [],
    );
  }

  /// `You deleted this message`
  String get you_deleted_this_message {
    return Intl.message(
      'You deleted this message',
      name: 'you_deleted_this_message',
      desc: '',
      args: [],
    );
  }

  /// `This message has been deleted by the sender.`
  String get delete_by_sender {
    return Intl.message(
      'This message has been deleted by the sender.',
      name: 'delete_by_sender',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this message?`
  String get confirm_delete_message {
    return Intl.message(
      'Are you sure you want to delete this message?',
      name: 'confirm_delete_message',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `View profile`
  String get view_profile {
    return Intl.message(
      'View profile',
      name: 'view_profile',
      desc: '',
      args: [],
    );
  }

  /// `My posts`
  String get my_posts {
    return Intl.message(
      'My posts',
      name: 'my_posts',
      desc: '',
      args: [],
    );
  }

  /// `Share this App`
  String get share_this_app {
    return Intl.message(
      'Share this App',
      name: 'share_this_app',
      desc: '',
      args: [],
    );
  }

  /// `Let''s find your job`
  String get find_your_job {
    return Intl.message(
      'Let\'\'s find your job',
      name: 'find_your_job',
      desc: '',
      args: [],
    );
  }

  /// `Search for job`
  String get search_for_job {
    return Intl.message(
      'Search for job',
      name: 'search_for_job',
      desc: '',
      args: [],
    );
  }

  /// `No jobs found`
  String get no_jobs_found {
    return Intl.message(
      'No jobs found',
      name: 'no_jobs_found',
      desc: '',
      args: [],
    );
  }

  /// `Part time`
  String get part_time {
    return Intl.message(
      'Part time',
      name: 'part_time',
      desc: '',
      args: [],
    );
  }

  /// `Full time`
  String get full_time {
    return Intl.message(
      'Full time',
      name: 'full_time',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get egypt_currency {
    return Intl.message(
      'EGP',
      name: 'egypt_currency',
      desc: '',
      args: [],
    );
  }

  /// `hr work`
  String get hr_work {
    return Intl.message(
      'hr work',
      name: 'hr_work',
      desc: '',
      args: [],
    );
  }

  /// `Posted`
  String get posted {
    return Intl.message(
      'Posted',
      name: 'posted',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Job type`
  String get job_type {
    return Intl.message(
      'Job type',
      name: 'job_type',
      desc: '',
      args: [],
    );
  }

  /// `Work hours`
  String get work_hours {
    return Intl.message(
      'Work hours',
      name: 'work_hours',
      desc: '',
      args: [],
    );
  }

  /// `Salary`
  String get salary {
    return Intl.message(
      'Salary',
      name: 'salary',
      desc: '',
      args: [],
    );
  }

  /// `Requirements`
  String get requirements {
    return Intl.message(
      'Requirements',
      name: 'requirements',
      desc: '',
      args: [],
    );
  }

  /// `Apply now`
  String get apply_now {
    return Intl.message(
      'Apply now',
      name: 'apply_now',
      desc: '',
      args: [],
    );
  }

  /// `Add a job`
  String get add_a_job {
    return Intl.message(
      'Add a job',
      name: 'add_a_job',
      desc: '',
      args: [],
    );
  }

  /// `Job title`
  String get job_title {
    return Intl.message(
      'Job title',
      name: 'job_title',
      desc: '',
      args: [],
    );
  }

  /// `Job description`
  String get job_description {
    return Intl.message(
      'Job description',
      name: 'job_description',
      desc: '',
      args: [],
    );
  }

  /// `Whatsapp`
  String get whatsapp {
    return Intl.message(
      'Whatsapp',
      name: 'whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Enter the requirements`
  String get enter_the_requirements {
    return Intl.message(
      'Enter the requirements',
      name: 'enter_the_requirements',
      desc: '',
      args: [],
    );
  }

  /// `Enter job description`
  String get enter_job_description {
    return Intl.message(
      'Enter job description',
      name: 'enter_job_description',
      desc: '',
      args: [],
    );
  }

  /// `Enter job title`
  String get enter_job_title {
    return Intl.message(
      'Enter job title',
      name: 'enter_job_title',
      desc: '',
      args: [],
    );
  }

  /// `Find your home`
  String get find_your_home {
    return Intl.message(
      'Find your home',
      name: 'find_your_home',
      desc: '',
      args: [],
    );
  }

  /// `Search on properties`
  String get search_on_properties {
    return Intl.message(
      'Search on properties',
      name: 'search_on_properties',
      desc: '',
      args: [],
    );
  }

  /// `m`
  String get meter_short {
    return Intl.message(
      'm',
      name: 'meter_short',
      desc: '',
      args: [],
    );
  }

  /// `Meter`
  String get meter_lone {
    return Intl.message(
      'Meter',
      name: 'meter_lone',
      desc: '',
      args: [],
    );
  }

  /// `km`
  String get killo_meter_short {
    return Intl.message(
      'km',
      name: 'killo_meter_short',
      desc: '',
      args: [],
    );
  }

  /// `Kilometer`
  String get killo_meter_lone {
    return Intl.message(
      'Kilometer',
      name: 'killo_meter_lone',
      desc: '',
      args: [],
    );
  }

  /// `Sale`
  String get sale {
    return Intl.message(
      'Sale',
      name: 'sale',
      desc: '',
      args: [],
    );
  }

  /// `Rent`
  String get rent {
    return Intl.message(
      'Rent',
      name: 'rent',
      desc: '',
      args: [],
    );
  }

  /// `Buy now`
  String get buy_now {
    return Intl.message(
      'Buy now',
      name: 'buy_now',
      desc: '',
      args: [],
    );
  }

  /// `Add property`
  String get add_property {
    return Intl.message(
      'Add property',
      name: 'add_property',
      desc: '',
      args: [],
    );
  }

  /// `Description of property`
  String get description_of_property {
    return Intl.message(
      'Description of property',
      name: 'description_of_property',
      desc: '',
      args: [],
    );
  }

  /// `Property address`
  String get property_address {
    return Intl.message(
      'Property address',
      name: 'property_address',
      desc: '',
      args: [],
    );
  }

  /// `Enter property address`
  String get enter_property_address {
    return Intl.message(
      'Enter property address',
      name: 'enter_property_address',
      desc: '',
      args: [],
    );
  }

  /// `Add location`
  String get add_location {
    return Intl.message(
      'Add location',
      name: 'add_location',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `Upload property images`
  String get upload_property_images {
    return Intl.message(
      'Upload property images',
      name: 'upload_property_images',
      desc: '',
      args: [],
    );
  }

  /// `Maximum upload of {number} images, and minimum of 1 image`
  String max_no_of_image_uploads(Object number) {
    return Intl.message(
      'Maximum upload of $number images, and minimum of 1 image',
      name: 'max_no_of_image_uploads',
      desc: '',
      args: [number],
    );
  }

  /// `Post now`
  String get post_now {
    return Intl.message(
      'Post now',
      name: 'post_now',
      desc: '',
      args: [],
    );
  }

  /// `Offer type`
  String get offer_type {
    return Intl.message(
      'Offer type',
      name: 'offer_type',
      desc: '',
      args: [],
    );
  }

  /// `Properties`
  String get properties {
    return Intl.message(
      'Properties',
      name: 'properties',
      desc: '',
      args: [],
    );
  }

  /// `No properties found`
  String get no_properties_found {
    return Intl.message(
      'No properties found',
      name: 'no_properties_found',
      desc: '',
      args: [],
    );
  }

  /// `Remove images`
  String get remove_images {
    return Intl.message(
      'Remove images',
      name: 'remove_images',
      desc: '',
      args: [],
    );
  }

  /// `The property has been added successfully`
  String get add_property_success {
    return Intl.message(
      'The property has been added successfully',
      name: 'add_property_success',
      desc: '',
      args: [],
    );
  }

  /// `The property has been updated successfully`
  String get edit_property_success {
    return Intl.message(
      'The property has been updated successfully',
      name: 'edit_property_success',
      desc: '',
      args: [],
    );
  }

  /// `The job has been added successfully`
  String get add_job_success {
    return Intl.message(
      'The job has been added successfully',
      name: 'add_job_success',
      desc: '',
      args: [],
    );
  }

  /// `The job has been updated successfully`
  String get edit_job_success {
    return Intl.message(
      'The job has been updated successfully',
      name: 'edit_job_success',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message(
      'Call',
      name: 'call',
      desc: '',
      args: [],
    );
  }

  /// `Send message`
  String get send_message {
    return Intl.message(
      'Send message',
      name: 'send_message',
      desc: '',
      args: [],
    );
  }

  /// `Remove profile image`
  String get remove_profile_image {
    return Intl.message(
      'Remove profile image',
      name: 'remove_profile_image',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get required_field_validation_message {
    return Intl.message(
      'This field is required',
      name: 'required_field_validation_message',
      desc: '',
      args: [],
    );
  }

  /// `Invalid format`
  String get pattern_validation_message {
    return Intl.message(
      'Invalid format',
      name: 'pattern_validation_message',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid number`
  String get number_validation_message {
    return Intl.message(
      'Please enter a valid number',
      name: 'number_validation_message',
      desc: '',
      args: [],
    );
  }

  /// `Fields must match`
  String get mustMatch_validation_message {
    return Intl.message(
      'Fields must match',
      name: 'mustMatch_validation_message',
      desc: '',
      args: [],
    );
  }

  /// `Minimum length: {number} characters.`
  String minLength_validation_message(Object number) {
    return Intl.message(
      'Minimum length: $number characters.',
      name: 'minLength_validation_message',
      desc: '',
      args: [number],
    );
  }

  /// `Maximum length: {number} characters.`
  String maxLength_validation_message(Object number) {
    return Intl.message(
      'Maximum length: $number characters.',
      name: 'maxLength_validation_message',
      desc: '',
      args: [number],
    );
  }

  /// `Please enter a valid email address`
  String get email_validation_message {
    return Intl.message(
      'Please enter a valid email address',
      name: 'email_validation_message',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid credit card number`
  String get creditCard_validation_message {
    return Intl.message(
      'Please enter a valid credit card number',
      name: 'creditCard_validation_message',
      desc: '',
      args: [],
    );
  }

  /// `Value must be less than or equal to {number}`
  String max_validation_message(Object number) {
    return Intl.message(
      'Value must be less than or equal to $number',
      name: 'max_validation_message',
      desc: '',
      args: [number],
    );
  }

  /// `Value must be greater than or equal to {number}`
  String min_validation_message(Object number) {
    return Intl.message(
      'Value must be greater than or equal to $number',
      name: 'min_validation_message',
      desc: '',
      args: [number],
    );
  }

  /// `Fields must be equal`
  String get equals_validation_message {
    return Intl.message(
      'Fields must be equal',
      name: 'equals_validation_message',
      desc: '',
      args: [],
    );
  }

  /// `This field must be checked`
  String get requiredTrue_validation_message {
    return Intl.message(
      'This field must be checked',
      name: 'requiredTrue_validation_message',
      desc: '',
      args: [],
    );
  }

  /// `Values do not match`
  String get compare_validation_message {
    return Intl.message(
      'Values do not match',
      name: 'compare_validation_message',
      desc: '',
      args: [],
    );
  }

  /// `Invalid value`
  String get contains_validation_message {
    return Intl.message(
      'Invalid value',
      name: 'contains_validation_message',
      desc: '',
      args: [],
    );
  }

  /// `Invalid value`
  String get any_validation_message {
    return Intl.message(
      'Invalid value',
      name: 'any_validation_message',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Saved`
  String get saved {
    return Intl.message(
      'Saved',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `Jobs`
  String get jobs {
    return Intl.message(
      'Jobs',
      name: 'jobs',
      desc: '',
      args: [],
    );
  }

  /// `My business`
  String get my_business {
    return Intl.message(
      'My business',
      name: 'my_business',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete post?`
  String get delete_post {
    return Intl.message(
      'Delete post?',
      name: 'delete_post',
      desc: '',
      args: [],
    );
  }

  /// `Edit post`
  String get edit_post {
    return Intl.message(
      'Edit post',
      name: 'edit_post',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Edit location`
  String get edit_location {
    return Intl.message(
      'Edit location',
      name: 'edit_location',
      desc: '',
      args: [],
    );
  }

  /// `Delete property images?`
  String get delete_property_images {
    return Intl.message(
      'Delete property images?',
      name: 'delete_property_images',
      desc: '',
      args: [],
    );
  }

  /// `Add requirement`
  String get add_requirement {
    return Intl.message(
      'Add requirement',
      name: 'add_requirement',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Remove requirement?`
  String get remove_requirement {
    return Intl.message(
      'Remove requirement?',
      name: 'remove_requirement',
      desc: '',
      args: [],
    );
  }

  /// `Add business`
  String get add_business {
    return Intl.message(
      'Add business',
      name: 'add_business',
      desc: '',
      args: [],
    );
  }

  /// `The business has been added successfully`
  String get add_business_success {
    return Intl.message(
      'The business has been added successfully',
      name: 'add_business_success',
      desc: '',
      args: [],
    );
  }

  /// `Description of business`
  String get description_of_business {
    return Intl.message(
      'Description of business',
      name: 'description_of_business',
      desc: '',
      args: [],
    );
  }

  /// `Business address`
  String get business_address {
    return Intl.message(
      'Business address',
      name: 'business_address',
      desc: '',
      args: [],
    );
  }

  /// `Enter business address`
  String get enter_business_address {
    return Intl.message(
      'Enter business address',
      name: 'enter_business_address',
      desc: '',
      args: [],
    );
  }

  /// `Upload business images`
  String get upload_business_images {
    return Intl.message(
      'Upload business images',
      name: 'upload_business_images',
      desc: '',
      args: [],
    );
  }

  /// `Business name`
  String get business_name {
    return Intl.message(
      'Business name',
      name: 'business_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter business name`
  String get enter_business_name {
    return Intl.message(
      'Enter business name',
      name: 'enter_business_name',
      desc: '',
      args: [],
    );
  }

  /// `Delete business images?`
  String get delete_business_images {
    return Intl.message(
      'Delete business images?',
      name: 'delete_business_images',
      desc: '',
      args: [],
    );
  }

  /// `Select business category`
  String get select_business_category {
    return Intl.message(
      'Select business category',
      name: 'select_business_category',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Delete main business image`
  String get delete_main_business_image {
    return Intl.message(
      'Delete main business image',
      name: 'delete_main_business_image',
      desc: '',
      args: [],
    );
  }

  /// `Upload main business image`
  String get upload_main_business_image {
    return Intl.message(
      'Upload main business image',
      name: 'upload_main_business_image',
      desc: '',
      args: [],
    );
  }

  /// `Select your working hours for each day from 0 to 24.`
  String get work_time {
    return Intl.message(
      'Select your working hours for each day from 0 to 24.',
      name: 'work_time',
      desc: '',
      args: [],
    );
  }

  /// `Add service`
  String get add_service {
    return Intl.message(
      'Add service',
      name: 'add_service',
      desc: '',
      args: [],
    );
  }

  /// `The service has been added successfully`
  String get add_service_success {
    return Intl.message(
      'The service has been added successfully',
      name: 'add_service_success',
      desc: '',
      args: [],
    );
  }

  /// `The service has been updated successfully`
  String get edit_service_success {
    return Intl.message(
      'The service has been updated successfully',
      name: 'edit_service_success',
      desc: '',
      args: [],
    );
  }

  /// `Description of service`
  String get description_of_service {
    return Intl.message(
      'Description of service',
      name: 'description_of_service',
      desc: '',
      args: [],
    );
  }

  /// `Service address`
  String get service_address {
    return Intl.message(
      'Service address',
      name: 'service_address',
      desc: '',
      args: [],
    );
  }

  /// `Enter service address`
  String get enter_service_address {
    return Intl.message(
      'Enter service address',
      name: 'enter_service_address',
      desc: '',
      args: [],
    );
  }

  /// `Upload service images`
  String get upload_service_images {
    return Intl.message(
      'Upload service images',
      name: 'upload_service_images',
      desc: '',
      args: [],
    );
  }

  /// `Delete service images?`
  String get delete_service_images {
    return Intl.message(
      'Delete service images?',
      name: 'delete_service_images',
      desc: '',
      args: [],
    );
  }

  /// `Select service category`
  String get select_service_category {
    return Intl.message(
      'Select service category',
      name: 'select_service_category',
      desc: '',
      args: [],
    );
  }

  /// `Delete main service image`
  String get delete_main_service_image {
    return Intl.message(
      'Delete main service image',
      name: 'delete_main_service_image',
      desc: '',
      args: [],
    );
  }

  /// `Upload main service image`
  String get upload_main_service_image {
    return Intl.message(
      'Upload main service image',
      name: 'upload_main_service_image',
      desc: '',
      args: [],
    );
  }

  /// `My services`
  String get my_services {
    return Intl.message(
      'My services',
      name: 'my_services',
      desc: '',
      args: [],
    );
  }

  /// `Your address`
  String get your_address {
    return Intl.message(
      'Your address',
      name: 'your_address',
      desc: '',
      args: [],
    );
  }

  /// `Enter your address`
  String get enter_your_address {
    return Intl.message(
      'Enter your address',
      name: 'enter_your_address',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Edit business`
  String get edit_business {
    return Intl.message(
      'Edit business',
      name: 'edit_business',
      desc: '',
      args: [],
    );
  }

  /// `Edit service`
  String get edit_service {
    return Intl.message(
      'Edit service',
      name: 'edit_service',
      desc: '',
      args: [],
    );
  }

  /// `Sign up successful! Check your email for confirmation and log in.`
  String get sign_up_success_message {
    return Intl.message(
      'Sign up successful! Check your email for confirmation and log in.',
      name: 'sign_up_success_message',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email for the verification code.`
  String get check_your_email_for_verification_code {
    return Intl.message(
      'Please check your email for the verification code.',
      name: 'check_your_email_for_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Invalid OTP. Please try again or request a new one.`
  String get invalid_otp_code_msg {
    return Intl.message(
      'Invalid OTP. Please try again or request a new one.',
      name: 'invalid_otp_code_msg',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain`
  String get password_must_contain {
    return Intl.message(
      'Password must contain',
      name: 'password_must_contain',
      desc: '',
      args: [],
    );
  }

  /// `at least 9 characters.`
  String get password_requirements_length {
    return Intl.message(
      'at least 9 characters.',
      name: 'password_requirements_length',
      desc: '',
      args: [],
    );
  }

  /// `at least one uppercase letter.`
  String get password_requirements_uppercase {
    return Intl.message(
      'at least one uppercase letter.',
      name: 'password_requirements_uppercase',
      desc: '',
      args: [],
    );
  }

  /// `at least one lowercase letter.`
  String get password_requirements_lowercase {
    return Intl.message(
      'at least one lowercase letter.',
      name: 'password_requirements_lowercase',
      desc: '',
      args: [],
    );
  }

  /// `at least one digit.`
  String get password_requirements_digit {
    return Intl.message(
      'at least one digit.',
      name: 'password_requirements_digit',
      desc: '',
      args: [],
    );
  }

  /// `at least one special character.`
  String get password_requirements_special_character {
    return Intl.message(
      'at least one special character.',
      name: 'password_requirements_special_character',
      desc: '',
      args: [],
    );
  }

  /// `Edit job`
  String get edit_job {
    return Intl.message(
      'Edit job',
      name: 'edit_job',
      desc: '',
      args: [],
    );
  }

  /// `In Arabic`
  String get in_arabic {
    return Intl.message(
      'In Arabic',
      name: 'in_arabic',
      desc: '',
      args: [],
    );
  }

  /// `In English`
  String get in_english {
    return Intl.message(
      'In English',
      name: 'in_english',
      desc: '',
      args: [],
    );
  }

  /// `Edit property`
  String get edit_property {
    return Intl.message(
      'Edit property',
      name: 'edit_property',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Your review sent successfully`
  String get review_sent_successfully {
    return Intl.message(
      'Your review sent successfully',
      name: 'review_sent_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest {
    return Intl.message(
      'Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `You are currently browsing as a guest. To access all features, please sign up or log in.`
  String get guest_guard_message {
    return Intl.message(
      'You are currently browsing as a guest. To access all features, please sign up or log in.',
      name: 'guest_guard_message',
      desc: '',
      args: [],
    );
  }

  /// `Select holiday`
  String get select_holiday {
    return Intl.message(
      'Select holiday',
      name: 'select_holiday',
      desc: '',
      args: [],
    );
  }

  /// `Working`
  String get working {
    return Intl.message(
      'Working',
      name: 'working',
      desc: '',
      args: [],
    );
  }

  /// `Not working`
  String get not_working {
    return Intl.message(
      'Not working',
      name: 'not_working',
      desc: '',
      args: [],
    );
  }

  /// `Chatbot`
  String get chatbot {
    return Intl.message(
      'Chatbot',
      name: 'chatbot',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get delete_account {
    return Intl.message(
      'Delete account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get delete_account_message {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'delete_account_message',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfServiceTitle {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfServiceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the "BNS360" app. By using the app, you agree to the following terms of service:\n\nUse of Service: The app is provided to help you find various services in Beni Suef. Any illegal use of the app is prohibited.\n\nRegistration: When registering, the information you provide must be accurate and up-to-date. You are responsible for protecting your password.\n\nIntellectual Property: All intellectual property rights in the app and its content belong to "BNS360". You may not copy or modify any part of the app without permission.\n\nReviews and Comments: All reviews and comments must be honest and respectful. "BNS360" reserves the right to remove any inappropriate content.\n\nDisclaimer: The app is provided "as is". "BNS360" is not responsible for the accuracy or completeness of the information provided by users or service providers.\n\nChanges: "BNS360" reserves the right to modify the terms of service at any time. You will be notified of any significant changes.\n\nTermination: "BNS360" reserves the right to terminate or suspend your access to the app if you violate the terms of service.`
  String get termsOfServiceContent {
    return Intl.message(
      'Welcome to the "BNS360" app. By using the app, you agree to the following terms of service:\n\nUse of Service: The app is provided to help you find various services in Beni Suef. Any illegal use of the app is prohibited.\n\nRegistration: When registering, the information you provide must be accurate and up-to-date. You are responsible for protecting your password.\n\nIntellectual Property: All intellectual property rights in the app and its content belong to "BNS360". You may not copy or modify any part of the app without permission.\n\nReviews and Comments: All reviews and comments must be honest and respectful. "BNS360" reserves the right to remove any inappropriate content.\n\nDisclaimer: The app is provided "as is". "BNS360" is not responsible for the accuracy or completeness of the information provided by users or service providers.\n\nChanges: "BNS360" reserves the right to modify the terms of service at any time. You will be notified of any significant changes.\n\nTermination: "BNS360" reserves the right to terminate or suspend your access to the app if you violate the terms of service.',
      name: 'termsOfServiceContent',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUsTitle {
    return Intl.message(
      'Contact Us',
      name: 'contactUsTitle',
      desc: '',
      args: [],
    );
  }

  /// `We're here to help! If you have any inquiries or suggestions, feel free to contact us via the email or phone number provided below.\n\nWe value your feedback and will endeavor to respond to you as soon as possible.`
  String get contactUsContent {
    return Intl.message(
      'We\'re here to help! If you have any inquiries or suggestions, feel free to contact us via the email or phone number provided below.\n\nWe value your feedback and will endeavor to respond to you as soon as possible.',
      name: 'contactUsContent',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicyTitle {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Information We Collect: We collect information you provide when registering, such as your name, email, and location.\n\nHow We Use Information: We use the information to enhance our services and personalize your experience within the app.\n\nInformation Sharing: We do not share your personal information with third parties except as required by law.\n\nSecurity: We take necessary measures to protect your information from unauthorized access.\n\nYour Rights: You can access, update, or delete your personal information at any time through your account settings.\n\nChanges to Policy: We may update the privacy policy from time to time. You will be notified of any significant changes.`
  String get privacyPolicyContent {
    return Intl.message(
      'Information We Collect: We collect information you provide when registering, such as your name, email, and location.\n\nHow We Use Information: We use the information to enhance our services and personalize your experience within the app.\n\nInformation Sharing: We do not share your personal information with third parties except as required by law.\n\nSecurity: We take necessary measures to protect your information from unauthorized access.\n\nYour Rights: You can access, update, or delete your personal information at any time through your account settings.\n\nChanges to Policy: We may update the privacy policy from time to time. You will be notified of any significant changes.',
      name: 'privacyPolicyContent',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUsTitle {
    return Intl.message(
      'About Us',
      name: 'aboutUsTitle',
      desc: '',
      args: [],
    );
  }

  /// `"BNS360" is an app that helps newcomers in Beni-Suef find the best services based on visitor reviews and distance. Our goal is to provide an easy and seamless experience for users to meet their needs.`
  String get aboutUsContent {
    return Intl.message(
      '"BNS360" is an app that helps newcomers in Beni-Suef find the best services based on visitor reviews and distance. Our goal is to provide an easy and seamless experience for users to meet their needs.',
      name: 'aboutUsContent',
      desc: '',
      args: [],
    );
  }

  /// `For Inquiries and Suggestions`
  String get for_inquiries_and_suggestions {
    return Intl.message(
      'For Inquiries and Suggestions',
      name: 'for_inquiries_and_suggestions',
      desc: '',
      args: [],
    );
  }

  /// `For Support`
  String get for_support {
    return Intl.message(
      'For Support',
      name: 'for_support',
      desc: '',
      args: [],
    );
  }

  /// `Holiday`
  String get holiday {
    return Intl.message(
      'Holiday',
      name: 'holiday',
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

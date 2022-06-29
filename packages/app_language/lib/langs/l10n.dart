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

  /// `Failed to connect via google`
  String get GoogleLoginError {
    return Intl.message(
      'Failed to connect via google',
      name: 'GoogleLoginError',
      desc: '',
      args: [],
    );
  }

  /// `Note can't be empty`
  String get ReviewCreateEditTaskNoteValidatorMsg {
    return Intl.message(
      'Note can\'t be empty',
      name: 'ReviewCreateEditTaskNoteValidatorMsg',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get alertDialogCancelBtn {
    return Intl.message(
      'Cancel',
      name: 'alertDialogCancelBtn',
      desc: '',
      args: [],
    );
  }

  /// `This will logout. Are you sure?`
  String get alertDialogMessage {
    return Intl.message(
      'This will logout. Are you sure?',
      name: 'alertDialogMessage',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alertDialogTitle {
    return Intl.message(
      'Alert',
      name: 'alertDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get alertDialogYesBtn {
    return Intl.message(
      'Yes',
      name: 'alertDialogYesBtn',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get editModelAppBarRightSaveTitle {
    return Intl.message(
      'save',
      name: 'editModelAppBarRightSaveTitle',
      desc: '',
      args: [],
    );
  }

  /// `Todos`
  String get homeAppBarTitle {
    return Intl.message(
      'Todos',
      name: 'homeAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get loginBtnLinkCreateAccount {
    return Intl.message(
      'Create account',
      name: 'loginBtnLinkCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get loginBtnLinkSignIn {
    return Intl.message(
      'Sign in',
      name: 'loginBtnLinkSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get loginBtnSignIn {
    return Intl.message(
      'Sign In',
      name: 'loginBtnSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get loginBtnSignUp {
    return Intl.message(
      'Sign Up',
      name: 'loginBtnSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get loginTxtDontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'loginTxtDontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get loginTxtEmail {
    return Intl.message(
      'Email',
      name: 'loginTxtEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an email`
  String get loginTxtErrorEmail {
    return Intl.message(
      'Please enter an email',
      name: 'loginTxtErrorEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password with 6+ chars long`
  String get loginTxtErrorPassword {
    return Intl.message(
      'Please enter a password with 6+ chars long',
      name: 'loginTxtErrorPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email and/or password`
  String get loginTxtErrorSignIn {
    return Intl.message(
      'Invalid email and/or password',
      name: 'loginTxtErrorSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get loginTxtHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'loginTxtHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginTxtPassword {
    return Intl.message(
      'Password',
      name: 'loginTxtPassword',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get mainUITitle {
    return Intl.message(
      'Explore',
      name: 'mainUITitle',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get modelCreateEditNotesTxt {
    return Intl.message(
      'Notes',
      name: 'modelCreateEditNotesTxt',
      desc: '',
      args: [],
    );
  }

  /// `Business Photos`
  String get photosBusinessPhotoAppBarTitleTxt {
    return Intl.message(
      'Business Photos',
      name: 'photosBusinessPhotoAppBarTitleTxt',
      desc: '',
      args: [],
    );
  }

  /// `Edit Photo`
  String get photosCreateEditAppBarTitleEditTxt {
    return Intl.message(
      'Edit Photo',
      name: 'photosCreateEditAppBarTitleEditTxt',
      desc: '',
      args: [],
    );
  }

  /// `New Photo`
  String get photosCreateEditAppBarTitleNewTxt {
    return Intl.message(
      'New Photo',
      name: 'photosCreateEditAppBarTitleNewTxt',
      desc: '',
      args: [],
    );
  }

  /// `Local Photos`
  String get photosLocalAppBarTitleTxt {
    return Intl.message(
      'Local Photos',
      name: 'photosLocalAppBarTitleTxt',
      desc: '',
      args: [],
    );
  }

  /// `Edit Restaurant`
  String get restaurantsCreateEditAppBarTitleEditTxt {
    return Intl.message(
      'Edit Restaurant',
      name: 'restaurantsCreateEditAppBarTitleEditTxt',
      desc: '',
      args: [],
    );
  }

  /// `New Restaurant`
  String get restaurantsCreateEditAppBarTitleNewTxt {
    return Intl.message(
      'New Restaurant',
      name: 'restaurantsCreateEditAppBarTitleNewTxt',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant Name`
  String get restaurantsCreateEditDisplayNameTxt {
    return Intl.message(
      'Restaurant Name',
      name: 'restaurantsCreateEditDisplayNameTxt',
      desc: '',
      args: [],
    );
  }

  /// `Name can't be empty`
  String get restaurantsCreateEditDisplayNameValidatorMsg {
    return Intl.message(
      'Name can\'t be empty',
      name: 'restaurantsCreateEditDisplayNameValidatorMsg',
      desc: '',
      args: [],
    );
  }

  /// `Edit Event`
  String get eventsCreateEditAppBarTitleEditTxt {
    return Intl.message(
      'Edit Event',
      name: 'eventsCreateEditAppBarTitleEditTxt',
      desc: '',
      args: [],
    );
  }

  /// `New Event`
  String get eventsCreateEditAppBarTitleNewTxt {
    return Intl.message(
      'New Event',
      name: 'eventsCreateEditAppBarTitleNewTxt',
      desc: '',
      args: [],
    );
  }

  /// `Event Name`
  String get eventsCreateEditDisplayNameTxt {
    return Intl.message(
      'Event Name',
      name: 'eventsCreateEditDisplayNameTxt',
      desc: '',
      args: [],
    );
  }

  /// `Want`
  String get eventsCreateEditWantTxt {
    return Intl.message(
      'Want',
      name: 'eventsCreateEditWantTxt',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get eventsCreateEditStartDateTxt {
    return Intl.message(
      'Start Date',
      name: 'eventsCreateEditStartDateTxt',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get eventsCreateEditEndDateTxt {
    return Intl.message(
      'End Date',
      name: 'eventsCreateEditEndDateTxt',
      desc: '',
      args: [],
    );
  }

  /// `Select Person`
  String get eventsSelectPersonTitleTxt {
    return Intl.message(
      'Select Person',
      name: 'eventsSelectPersonTitleTxt',
      desc: '',
      args: [],
    );
  }

  /// `Select Waiter`
  String get eventsSelectWaiterTitleTxt {
    return Intl.message(
      'Select Waiter',
      name: 'eventsSelectWaiterTitleTxt',
      desc: '',
      args: [],
    );
  }

  /// `Delete successfully`
  String get ModelItemsDeleteSuccess {
    return Intl.message(
      'Delete successfully',
      name: 'ModelItemsDeleteSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Delete failure`
  String get ModelItemsDeleteFailure {
    return Intl.message(
      'Delete failure',
      name: 'ModelItemsDeleteFailure',
      desc: '',
      args: [],
    );
  }

  /// `Select Recipe`
  String get peopleInEventSelectRecipeTitleTxt {
    return Intl.message(
      'Select Recipe',
      name: 'peopleInEventSelectRecipeTitleTxt',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get pageAppBarRightEditBtnTitle {
    return Intl.message(
      'Edit',
      name: 'pageAppBarRightEditBtnTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Review`
  String get reviewsCreateEditAppBarTitleEditTxt {
    return Intl.message(
      'Edit Review',
      name: 'reviewsCreateEditAppBarTitleEditTxt',
      desc: '',
      args: [],
    );
  }

  /// `New Review`
  String get reviewsCreateEditAppBarTitleNewTxt {
    return Intl.message(
      'New Review',
      name: 'reviewsCreateEditAppBarTitleNewTxt',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get reviewsDetailPageAppBarTitleTxt {
    return Intl.message(
      'Review',
      name: 'reviewsDetailPageAppBarTitleTxt',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviewsListPageAppBarTitleTxt {
    return Intl.message(
      'Reviews',
      name: 'reviewsListPageAppBarTitleTxt',
      desc: '',
      args: [],
    );
  }

  /// `Edit Recipe`
  String get recipesCreateEditAppBarTitleEditTxt {
    return Intl.message(
      'Edit Recipe',
      name: 'recipesCreateEditAppBarTitleEditTxt',
      desc: '',
      args: [],
    );
  }

  /// `New Recipe`
  String get recipesCreateEditAppBarTitleNewTxt {
    return Intl.message(
      'New Recipe',
      name: 'recipesCreateEditAppBarTitleNewTxt',
      desc: '',
      args: [],
    );
  }

  /// `Recipe Name`
  String get recipesCreateEditDisplayNameTxt {
    return Intl.message(
      'Recipe Name',
      name: 'recipesCreateEditDisplayNameTxt',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get recipesCreateEditPriceTxt {
    return Intl.message(
      'Price',
      name: 'recipesCreateEditPriceTxt',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get settingAppTitle {
    return Intl.message(
      'Setting',
      name: 'settingAppTitle',
      desc: '',
      args: [],
    );
  }

  /// `Set Your Prefer Language`
  String get settingLanguageListSubTitle {
    return Intl.message(
      'Set Your Prefer Language',
      name: 'settingLanguageListSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settingLanguageListTitle {
    return Intl.message(
      'Language',
      name: 'settingLanguageListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get settingLogoutButton {
    return Intl.message(
      'Logout',
      name: 'settingLogoutButton',
      desc: '',
      args: [],
    );
  }

  /// `Log me out from here`
  String get settingLogoutListSubTitle {
    return Intl.message(
      'Log me out from here',
      name: 'settingLogoutListSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get settingLogoutListTitle {
    return Intl.message(
      'Logout',
      name: 'settingLogoutListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change to Chinese`
  String get settingPopUpToggleChinese {
    return Intl.message(
      'Change to Chinese',
      name: 'settingPopUpToggleChinese',
      desc: '',
      args: [],
    );
  }

  /// `Change to English`
  String get settingPopUpToggleEnglish {
    return Intl.message(
      'Change to English',
      name: 'settingPopUpToggleEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Turn On the Dark Side`
  String get settingThemeListSubTitle {
    return Intl.message(
      'Turn On the Dark Side',
      name: 'settingThemeListSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get settingThemeListTitle {
    return Intl.message(
      'Dark theme',
      name: 'settingThemeListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to `
  String get splashTitle {
    return Intl.message(
      'Welcome to ',
      name: 'splashTitle',
      desc: '',
      args: [],
    );
  }

  /// `saved successfully`
  String get toastForSaveSuccess {
    return Intl.message(
      'saved successfully',
      name: 'toastForSaveSuccess',
      desc: '',
      args: [],
    );
  }

  /// `saved failure`
  String get toastForSaveFailure {
    return Intl.message(
      'saved failure',
      name: 'toastForSaveFailure',
      desc: '',
      args: [],
    );
  }

  /// `Completed ?`
  String get todosCreateEditCompletedTxt {
    return Intl.message(
      'Completed ?',
      name: 'todosCreateEditCompletedTxt',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get todosDismissibleMsgTxt {
    return Intl.message(
      'Delete',
      name: 'todosDismissibleMsgTxt',
      desc: '',
      args: [],
    );
  }

  /// `Add a new item to get started`
  String get todosEmptyBottomDefaultMsgTxt {
    return Intl.message(
      'Add a new item to get started',
      name: 'todosEmptyBottomDefaultMsgTxt',
      desc: '',
      args: [],
    );
  }

  /// `Nothing here`
  String get todosEmptyTopMsgDefaultTxt {
    return Intl.message(
      'Nothing here',
      name: 'todosEmptyTopMsgDefaultTxt',
      desc: '',
      args: [],
    );
  }

  /// `Can't load data right now`
  String get todosErrorBottomMsgTxt {
    return Intl.message(
      'Can\'t load data right now',
      name: 'todosErrorBottomMsgTxt',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get todosErrorTopMsgTxt {
    return Intl.message(
      'Something went wrong',
      name: 'todosErrorTopMsgTxt',
      desc: '',
      args: [],
    );
  }

  /// `Mark all complete`
  String get todosPopUpToggleAllComplete {
    return Intl.message(
      'Mark all complete',
      name: 'todosPopUpToggleAllComplete',
      desc: '',
      args: [],
    );
  }

  /// `Clear all completed`
  String get todosPopUpToggleClearCompleted {
    return Intl.message(
      'Clear all completed',
      name: 'todosPopUpToggleClearCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get todosSnackBarActionLbl {
    return Intl.message(
      'Undo',
      name: 'todosSnackBarActionLbl',
      desc: '',
      args: [],
    );
  }

  /// `Deleted `
  String get todosSnackBarContent {
    return Intl.message(
      'Deleted ',
      name: 'todosSnackBarContent',
      desc: '',
      args: [],
    );
  }

  /// `Photos`
  String get userMenuPhotosAppBarTitle {
    return Intl.message(
      'Photos',
      name: 'userMenuPhotosAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants`
  String get userMenuRestaurantsAppBarTitle {
    return Intl.message(
      'Restaurants',
      name: 'userMenuRestaurantsAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get userMenuReviewsAppBarTitle {
    return Intl.message(
      'Reviews',
      name: 'userMenuReviewsAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit User`
  String get usersCreateEditAppBarTitleEditTxt {
    return Intl.message(
      'Edit User',
      name: 'usersCreateEditAppBarTitleEditTxt',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get usersCreateEditFirstNameTxt {
    return Intl.message(
      'First Name',
      name: 'usersCreateEditFirstNameTxt',
      desc: '',
      args: [],
    );
  }

  /// `First Name can't be empty`
  String get usersCreateEditFirstNameValidatorMsg {
    return Intl.message(
      'First Name can\'t be empty',
      name: 'usersCreateEditFirstNameValidatorMsg',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get usersCreateEditLastNameTxt {
    return Intl.message(
      'Last Name',
      name: 'usersCreateEditLastNameTxt',
      desc: '',
      args: [],
    );
  }

  /// `Last Name can't be empty`
  String get usersCreateEditLastNameValidatorMsg {
    return Intl.message(
      'Last Name can\'t be empty',
      name: 'usersCreateEditLastNameValidatorMsg',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get drawerMenuItemHome {
    return Intl.message(
      'Home',
      name: 'drawerMenuItemHome',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get drawerMenuItemProfile {
    return Intl.message(
      'Profile',
      name: 'drawerMenuItemProfile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get drawerMenuItemSettings {
    return Intl.message(
      'Settings',
      name: 'drawerMenuItemSettings',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friend`
  String get drawerMenuItemInvite {
    return Intl.message(
      'Invite Friend',
      name: 'drawerMenuItemInvite',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get drawerMenuItemHelp {
    return Intl.message(
      'Help',
      name: 'drawerMenuItemHelp',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get drawerMenuItemAbout {
    return Intl.message(
      'About',
      name: 'drawerMenuItemAbout',
      desc: '',
      args: [],
    );
  }

  /// `Uploading...`
  String get photosUploading {
    return Intl.message(
      'Uploading...',
      name: 'photosUploading',
      desc: '',
      args: [],
    );
  }

  /// `Saving...`
  String get addingItemText {
    return Intl.message(
      'Saving...',
      name: 'addingItemText',
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
      Locale.fromSubtags(languageCode: 'zh'),
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

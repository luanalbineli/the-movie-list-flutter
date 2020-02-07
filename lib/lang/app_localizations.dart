import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations extends WidgetsLocalizations {
  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static AppLocalizations of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  // BEGIN: Common
  String get textHome => 'Home';
  String get textSearch => 'Search';
  String get textCinema => 'Cinema';
  String get textLibrary => 'Library';
  String get textMostPopular => 'Most popular';
  String get textMostRated => 'Most rated';
  String get textSeeAll => 'See all';
  // END: Common
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('en', ''),
      Locale('pt', 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations());
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;

}
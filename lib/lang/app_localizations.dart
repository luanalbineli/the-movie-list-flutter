import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations extends WidgetsLocalizations {
  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static AppLocalizations of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  // BEGIN: Onboarding
  String get onboardingFirstPageSubtitle => 'A maneira mais rápida de receber seus clientes.';
  String get onboardingFirstPageTitle => 'Seus recebimentos em um clique.';
  String get onboardingSecondPageSubtitle => 'A maneira mais rápida de receber seus clientes.';
  String get onboardingSecondPageTitle => 'Atraia mais clientes para o seu estabelecimento.';
  // END: Onboarding
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
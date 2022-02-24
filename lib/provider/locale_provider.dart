import 'package:flutter/material.dart';
import 'package:flutter_book_app/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale ?_locale;

  Locale get locale => _locale ?? Locale('en');

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = Locale('en'); 
    notifyListeners();
  }
}

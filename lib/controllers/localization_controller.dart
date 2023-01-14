
import 'package:cmmtbook/langs/de_DE.dart';
import 'package:cmmtbook/langs/en_US.dart';
import 'package:cmmtbook/langs/es_ES.dart';
import 'package:cmmtbook/langs/pt_PT.dart';
import 'package:cmmtbook/langs/ru_RU.dart';
import 'package:cmmtbook/langs/tr_TR.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {


  // Default locale
  static final locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Türkçe',
    'Deutsch',
    'Pусский',
    'Português',
    'Español',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('tr', 'TR'),
    Locale('de', 'DE'),
    Locale('es', 'ES'),
    Locale('pt', 'PT'),
    Locale('ru', 'RU'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'tr_TR': trTR,
        'de_DE': deDE,
        'es_ES': esES,
        'pt_PT': ptPT,
        'ru_RU': ruRU
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
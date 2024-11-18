import 'package:flutter/material.dart';

import 'package:pumpkin/core/utils/extensions/localozation_extension.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;

  String get getCountryCode => Localizations.localeOf(this).languageCode;
}

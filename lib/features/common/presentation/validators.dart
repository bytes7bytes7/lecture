import '../../../constants/app.dart' as const_app;
import '../../../l10n/l10n.dart';

final _emailRegex = RegExp(
  '(?:'
  "[a-z0-9!#\$%&'*+/=?^_`{|}~-]+"
  "(?:\\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*"
  ')'
  '@'
  '(?:'
  '(?:[a-z0-9]'
  '(?:'
  '[a-z0-9-]*'
  '[a-z0-9]'
  ')?\\.'
  ')+'
  '[a-z0-9]'
  '(?:[a-z0-9-]*[a-z0-9])?'
  '|'
  '\\['
  '(?:'
  '(?:'
  '25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?'
  ')\\.'
  '){3}'
  '(?:'
  '25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?'
  ')'
  '\\]'
  ')',
  caseSensitive: false,
);

String? emailValidator({
  required String? value,
  required AppLocalizations l10n,
}) {
  if (value == null || value.isEmpty) {
    return l10n.fillField;
  }

  if (!_emailRegex.hasMatch(value)) {
    return l10n.invalid;
  }

  return null;
}

String? passwdValidator({
  required String? value,
  required AppLocalizations l10n,
}) {
  if (value == null || value.isEmpty) {
    return l10n.fillField;
  }

  final error = _checkPasswd(value: value, l10n: l10n);
  if (error != null) {
    return error;
  }

  return null;
}

String? repeatPasswdValidator({
  required String? value,
  required String prevValue,
  required AppLocalizations l10n,
}) {
  if (value == null || value.isEmpty) {
    return l10n.fillField;
  }

  final error = _checkPasswd(value: value, l10n: l10n);
  if (error != null) {
    return error;
  }

  if (value != prevValue) {
    return l10n.passwordsDoNotMatch;
  }

  return null;
}

String? simpleValidator({
  required String? value,
  required AppLocalizations l10n,
}) {
  if (value == null || value.isEmpty) {
    return l10n.fillField;
  }

  return null;
}

String? _checkPasswd({
  required String value,
  required AppLocalizations l10n,
}) {
  if (value.length < const_app.minPasswdLen) {
    return l10n.passwordTooShort;
  }

  return null;
}

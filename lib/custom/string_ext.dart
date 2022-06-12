extension StringExt on String {
  String get capitalized {
    if (isNotEmpty) {
      final letters = split('');
      letters[0] = letters[0].toUpperCase();

      return letters.join('');
    }

    return this;
  }
}

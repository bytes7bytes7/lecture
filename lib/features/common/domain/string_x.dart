extension StringX on String {
  String get capitalized {
    if (isEmpty) {
      return this;
    }

    if (length == 1) {
      return this[0].toUpperCase();
    }

    return this[0].toUpperCase() + substring(1);
  }
}

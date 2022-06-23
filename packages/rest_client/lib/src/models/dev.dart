// TODO: remove this file
import 'dart:math';

const _ru = 'йцукенгшщзхъфывапролджэячсмитьбю ';
const _en = 'qwertyuiopasdfghjklzxcvbnm ';
final _rand = Random();

int randomInt(int max) {
  if (max <= 0) {
    return -1;
  }

  return _rand.nextInt(max);
}

double randomDouble(int max) {
  if (max <= 0) {
    return -1;
  }

  return _rand.nextInt(max - 1) + _rand.nextDouble();
}

String randomString(int length, {bool noSpace = false, bool useEn = false}) {
  var chars = _ru;

  if (useEn) {
    chars = _en;
  }

  if (noSpace) {
    chars = chars.replaceAll(' ', '');
  }

  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(randomInt(chars.length)),
    ),
  );
}

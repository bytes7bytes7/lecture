// TODO: remove this file
import 'dart:math';

const _num = '0123456789';
const _ru = 'йцукенгшщзхъфывапролджэячсмитьбю ';
const _en = 'qwertyuiopasdfghjklzxcvbnm ';
final _rand = Random();

bool randomBool() {
  return randomInt(2) == 1;
}

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

String randomString(
  int length, {
  bool noSpace = false,
  bool useEn = false,
  bool useNum = false,
}) {
  var chars = _ru;

  if (useEn) {
    chars = _en;
  }

  if (useNum) {
    chars += _num;
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

List<T> randomList<T>(int length) {
  if (T == int) {
    return List.generate(length, (index) => randomInt(256) as T);
  } else if (T == String) {
    return List.generate(length, (index) => randomString(256) as T);
  } else if (T is double) {
    return List.generate(length, (index) => randomDouble(256) as T);
  }

  throw Exception('Can not create random list of type: ${T.runtimeType}');
}

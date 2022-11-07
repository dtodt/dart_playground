import 'dart:math';

const _kAvailableChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
const _kAlphabetSize = 26;
const _kAlphaBegin = 65;
const _kAlphaEnd = 90;
const _kNumbersBegin = 48;
const _kNumbersEnd = 57;

typedef CipherMutation = int Function(int keyCode, int textCode);

///
class VigenereCipher {
  ///
  static String generateKey(int length) {
    final random = Random();
    return List.generate(length,
            (_) => _kAvailableChars[random.nextInt(_kAvailableChars.length)])
        .join();
  }

  ///
  static String encode({required String key, required String text}) {
    return _mutate(key, text, _encodeChar);
  }

  ///
  static String decode({required String key, required String text}) {
    return _mutate(key, text, _decodeChar);
  }

  static String _mutate(String key, String text, CipherMutation mutation) {
    final upperText = text.toUpperCase();

    final mutated = <int>[];
    for (var c = 0, len = text.length; c < len; c++) {
      final keyCode = key.runes.elementAt(c);
      final textCode = upperText.runes.elementAt(c);
      if (_isAlphaNumeric(textCode)) {
        mutated.add(mutation(keyCode, textCode));
      } else {
        mutated.add(textCode);
      }
    }

    return String.fromCharCodes(mutated);
  }

  static bool _isAlphaNumeric(int code) =>
      (code >= _kNumbersBegin && code <= _kNumbersEnd) ||
      (code >= _kAlphaBegin && code <= _kAlphaEnd);

  static int _encodeChar(int keyCode, int textCode) =>
      ((keyCode + textCode) % _kAlphabetSize) + _kAlphaBegin;

  static int _decodeChar(int keyCode, int textCode) =>
      (((textCode - keyCode) + _kAlphabetSize) % _kAlphabetSize) + _kAlphaBegin;
}

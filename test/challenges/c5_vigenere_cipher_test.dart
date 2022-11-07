import 'package:dart_playground/lib.dart';
import 'package:test/test.dart';

const _kSampleKey = 'UAS7L9QKH9';
const _kDecodedText = 'OLÁ MUNDO!';
const _kEncodedText = 'ILÁ XMDNV!';

void main() {
  test('should generate a random string', () async {
    final result = VigenereCipher.generateKey(10);
    expect(result, isNotEmpty);
    expect(result.length, equals(10));
  });

  test('should encode the provided text', () async {
    expect(
      VigenereCipher.encode(key: _kSampleKey, text: _kDecodedText),
      equals(_kEncodedText),
    );
  });

  test('should decode the provided text', () async {
    expect(
      VigenereCipher.decode(key: _kSampleKey, text: _kEncodedText),
      equals(_kDecodedText),
    );
  });
}

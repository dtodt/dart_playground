import 'package:dart_playground/lib.dart';
import 'package:test/test.dart';

void main() {
  test('should remove any non number', () async {
    expect(cleanUpNumber(' Abc: 123 '), equals('123'));
  });

  test('should verify digits', () async {
    expect(hasSameDigit([1, 2, 3]), isFalse);
  });

  test('should parse string into digit list', () async {
    expect(parseNumberDigits('123'), equals([1, 2, 3]));
  });
}

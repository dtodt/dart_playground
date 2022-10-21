import 'package:dart_playground/lib.dart';
import 'package:test/test.dart';

void main() {
  test('should be invalid', () {
    expect(validateCreditCard('5419 8250 0346 1210'), isFalse);
  });

  test('should be invalid 2', () {
    expect(validateCreditCard('0000 0000 0000 0000'), isFalse);
  });

  test('should be valid', () {
    expect(validateCreditCard('4916 6418 5936 9080'), isTrue);
  });

  test('should generate a valid card', () {
    final number = generateCreditCard();
    expect(validateCreditCard(number), isTrue);
  });
}

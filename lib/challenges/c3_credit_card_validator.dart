import 'dart:math';

import 'package:dart_playground/helpers.dart';

// Extra challenge - credit card generator
String generateCreditCard([int size = 16]) {
  final digits = List.generate(size - 1, (index) => Random().nextInt(9));
  final lastDigit = _calculateLastDigit(digits);
  digits.add(lastDigit);
  return digits.join();
}

//
bool validateCreditCard(String number) {
  print('Validating credit card number: $number');
  final cleanedNumber = cleanUpNumber(number);
  final numberDigits = parseNumberDigits(cleanedNumber);
  if (hasSameDigit(numberDigits)) {
    return false;
  }

  final lastDigit = numberDigits.removeLast();
  final verifier = _calculateLastDigit(numberDigits);
  return verifier == lastDigit;
}

int _calculateLastDigit(List<int> digits) {
  final cardSum = _calculateCardDigits(digits);
  return (10 - cardSum % 10) % 10;
}

int _calculateCardDigits(List<int> digits) {
  var sum = 0;
  for (var d = 0; d < digits.length; d++) {
    var digitSum = digits[d] * _getColumnMultiplier(d + 1);
    if (digitSum > 9) {
      digitSum -= 9;
    }
    sum += digitSum;
  }
  return sum;
}

int _getColumnMultiplier(int column) {
  return column % 2 == 0 ? 1 : 2;
}

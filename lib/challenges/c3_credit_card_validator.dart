import 'package:dart_playground/helpers.dart';

//
bool validateCreditCard(String number) {
  print('Validating credit card number: $number');
  final cleanedNumber = cleanUpNumber(number);
  final numberDigits = parseNumberDigits(cleanedNumber);
  if (hasSameDigit(numberDigits)) {
    return false;
  }

  final lastDigit = numberDigits.removeLast();
  final cardSum = calculateCardDigits(numberDigits);

  final verifier = (10 - cardSum % 10) % 10;
  final valid = verifier == lastDigit;

  print('Is valid: $valid');
  return valid;
}

int calculateCardDigits(List<int> digits) {
  var sum = 0;
  for (var d = 0; d < digits.length; d++) {
    var digitSum = digits[d] * getColumnMultiplier(d + 1);
    if (digitSum > 9) {
      digitSum -= 9;
    }
    sum += digitSum;
  }
  return sum;
}

int getColumnMultiplier(int column) {
  return column % 2 == 0 ? 1 : 2;
}

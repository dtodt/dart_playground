import 'dart:math';

import 'package:dart_playground/helpers.dart';

// Extra challenge - cpf generator
String generateCPF() {
  final digits = List.generate(9, (index) => Random().nextInt(9));
  final firstVerifier = calculateDigit(digits);
  digits.add(firstVerifier);
  final secondVerifier = calculateDigit(digits);
  digits.add(secondVerifier);
  return digits.join();
}

//
bool validateCPF(String number) {
  print('Validating CPF number: $number');
  final cleanedNumber = cleanUpNumber(number);
  final numberDigits = parseNumberDigits(cleanedNumber);
  if (hasSameDigit(numberDigits) || numberDigits.length != 11) {
    return false;
  }

  final secondRef = numberDigits.removeLast();
  final int secondDigit = calculateDigit(numberDigits);
  if (secondRef != secondDigit) {
    return false;
  }

  final firstRef = numberDigits.removeLast();
  final int firstDigit = calculateDigit(numberDigits);
  return firstRef == firstDigit;
}

int calculateDigit(List<int> digits) {
  final digitSum = sumDigits(digits.reversed.toList());
  final rest = digitSum % 11;
  if (rest < 2) {
    return 0;
  } else {
    return 11 - rest;
  }
}

int sumDigits(List<int> digits) {
  var multiplier = 2;
  var sum = 0;
  for (var d = 0; d < digits.length; d++, multiplier++) {
    sum += digits[d] * multiplier;
  }
  return sum;
}

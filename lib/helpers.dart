const _kCleanNumberPattern = r'(\D)';

//
String cleanUpNumber(String number) {
  return number.trim().replaceAll(RegExp(_kCleanNumberPattern), '');
}

//
bool hasSameDigit(List<int> digits) {
  if (digits.isEmpty) return false;
  return digits.every((digit) => digit == digits[0]);
}

//
List<int> parseNumberDigits(String number) {
  return number.split('').map((e) => int.parse(e)).toList();
}

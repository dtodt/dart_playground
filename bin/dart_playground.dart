import 'package:dart_playground/lib.dart';

const _kChallengeTitle = '\nChallenge';

void main(List<String> arguments) {
  _printChallenge1();
  _printChallenge2();
  _printChallenge3();
}

void _printChallenge1() {
  print('$_kChallengeTitle 1 - Fibonacci');
  buildFibonacciSequence(10);
}

void _printChallenge2() {
  print('$_kChallengeTitle 2 - Rule of Three');
  ruleOfThree(a: 14, b: 100, c: 7);
}

void _printChallenge3() {
  print('$_kChallengeTitle 3 - Credit card validator');
  validateCreditCard('4916 6418 5936 9080');
  print('');
  validateCreditCard('5419 8250 0346 1210');
}

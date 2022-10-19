import 'package:dart_playground/lib.dart';

const _kChallengeTitle = '\nChallenge';

void main(List<String> arguments) {
  _printChallenge1();
  _printChallenge2();
}

void _printChallenge1() {
  print('$_kChallengeTitle 1 - Fibonacci');
  buildFibonacciSequence(10);
}

void _printChallenge2() {
  print('$_kChallengeTitle 2 - Rule of Three');
  ruleOfThree(a: 14, b: 100, c: 7);
}

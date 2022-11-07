import 'package:dart_playground/lib.dart';

const _kChallengeTitle = '\nChallenge';

void main(List<String> arguments) {
  _printChallenge1();
  _printChallenge2();
  _printChallenge3();
  _printChallenge4();
  _printChallenge5();
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
  print('Valid: ${validateCreditCard('5419 8250 0346 1210')}');
  print('');
  print('Valid: ${validateCreditCard('4916 6418 5936 9080')}');
}

void _printChallenge4() {
  print('$_kChallengeTitle 4 - CPF validator');
  print('Valid: ${validateCPF('050.087.420-85')}');
  print('');
  print('Valid: ${validateCPF('883.693.590-78')}');
}

void _printChallenge5() {
  print('$_kChallengeTitle 5 - Vigenere cipher');
  final text = 'This text will be criptographed';
  print('Ciphering: "$text"');
  final key = VigenereCipher.generateKey(text.length);
  final encoded = VigenereCipher.encode(key: key, text: text);
  print('Result: $encoded');
  print('');
  print(
      'Which can be decoded again to: ${VigenereCipher.decode(key: key, text: encoded)}');
}

import 'package:dart_playground/lib.dart';

const _kDefaultFibonacciCount = 10;
const _kInvalidArgumentsMsg = '''
Invalid challenge, please send the number reference below:
1 - Fibonacci
''';

void main(List<String> arguments) {
  if (arguments.isNotEmpty && int.tryParse(arguments[0]) != null) {
    final challenge = int.parse(arguments[0]);
    switch (challenge) {
      case 1:
        chooseFibonacciSequence(arguments);
        break;
      default:
        break;
    }
    return;
  }

  print(_kInvalidArgumentsMsg);
}

void chooseFibonacciSequence(List<String> arguments) {
  int? desiredCount;
  if (arguments.length > 1) {
    desiredCount = int.tryParse(arguments[1]) ?? _kDefaultFibonacciCount;
  }

  printFibonacciSequence(desiredCount ?? _kDefaultFibonacciCount);
}

void printFibonacciSequence(int desiredCount) {
  final startingPoint = DateTime.now();
  print('*** Fibonacci ***');
  if (desiredCount > 40) {
    print(buildFibonacciFastDoublingSequence(desiredCount));
  } else {
    print(buildFibonacciSequence(desiredCount));
  }
  final totalTime = DateTime.now().difference(startingPoint).inSeconds;
  print('*** Total time: $totalTime s ***');
}

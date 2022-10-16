import 'package:dart_playground/lib.dart';

const _kInvalidArgumentsMsg = '''
Invalid challenge, please send the number reference below:
1 - Fibonacci
''';

void main(List<String> arguments) {
  final challengeArgument = _getValueFrom(arguments, 0);
  if (arguments.isNotEmpty && int.tryParse(challengeArgument!) != null) {
    final challenge = int.parse(challengeArgument);
    switch (challenge) {
      case 1:
        _fibonacciSequence(_getRestFrom(arguments, 1));
        break;
      default:
        break;
    }
    return;
  }

  print(_kInvalidArgumentsMsg);
}

void _fibonacciSequence(List<String> arguments) {
  final countArgument = _getValueFrom(arguments, 0);
  final limitArgument = _getValueFrom(arguments, 1);
  final algorithmArgument = _getValueFrom(arguments, 2);

  int? count;
  if (countArgument != null) {
    count = int.tryParse(countArgument);
  }
  int? limit;
  if (limitArgument != null) {
    limit = int.tryParse(limitArgument);
  }

  printFibonacciSequence(
    count: count,
    limit: limit,
    algorithm: algorithmArgument,
  );
}

String? _getValueFrom(List<String> list, int index) {
  return list.length <= index ? null : list[index];
}

List<String> _getRestFrom(List<String> list, int startingPoint) {
  return list.length <= startingPoint ? [] : list.sublist(startingPoint);
}

const _kDefaultCount = 10;
const _kDefaultLimit = -1;

void printFibonacciSequence({int? count, int? limit, String? algorithm}) {
  final desiredCount = count ?? _kDefaultCount;
  final collectionLimit = limit ?? _kDefaultLimit;
  final algorithmType = FibonacciAlgorithmType.values.firstWhere(
    (type) => type.name == algorithm,
    orElse: () => FibonacciAlgorithmType.normal,
  );

  print('*** Fibonacci ${algorithmType.name} ***');

  final startingPoint = DateTime.now();
  final sequence = _buildFibonacciSequence(
    desiredCount,
    collectionLimit,
    FibonacciAlgorithmType.fast == algorithmType ? _ffd : _f,
  );
  final totalTime = DateTime.now().difference(startingPoint).inSeconds;

  print(sequence);
  print('*** Total time: $totalTime s ***');
}

List<String> _buildFibonacciSequence(
    int desiredCount, int collectionLimit, FibonacciAlgorithm f) {
  final sequence = <String>[];
  for (var n = 0; n <= desiredCount; n++) {
    if (collectionLimit == _kDefaultLimit ||
        n + 2 < collectionLimit ||
        n == desiredCount) {
      final result = f(n);
      sequence.add('$result');
    } else if (n + 2 == desiredCount) {
      sequence.add('...');
    }
  }
  return sequence;
}

typedef FibonacciAlgorithm = BigInt Function(int n);

enum FibonacciAlgorithmType {
  normal, // default
  fast, // fast doubling
}

/// Fibonacci
BigInt _f(int n) {
  if (n <= 2) return _untilTwo(n);
  return _f(n - 1) + _f(n - 2);
}

/// Fibonacci Fast Doubling
BigInt _ffd(int n) {
  if (n <= 2) return _untilTwo(n);

  final int k = n ~/ 2;
  final a = _ffd(k);
  final b = _ffd(k + 1);

  if (n % 2 != 0) {
    return a * a + b * b;
  }
  return a * (BigInt.two * b - a);
}

BigInt _untilTwo(int n) {
  return n == 0 ? BigInt.zero : BigInt.one;
}

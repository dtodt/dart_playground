List<int> buildFibonacciSequence(int desiredCount) {
  final sequence = <int>[];
  for (var n = 0; n < desiredCount; n++) {
    sequence.add(_f(n));
  }
  return sequence;
}

List<BigInt> buildFibonacciFastDoublingSequence(int desiredCount) {
  final sequence = <BigInt>[];
  for (var n = 0; n < desiredCount; n++) {
    sequence.add(_ffd(n));
  }
  return sequence;
}

/// Fibonacci
int _f(int n) {
  if (n <= 2) return _untilTwo(n);
  return _f(n - 1) + _f(n - 2);
}

/// Fibonacci Fast Doubling
BigInt _ffd(int n) {
  if (n <= 2) return BigInt.from(_untilTwo(n));

  final int k = n ~/ 2;
  final a = _ffd(k);
  final b = _ffd(k + 1);

  if (n % 2 != 0) {
    return a * a + b * b;
  }
  return a * (BigInt.from(2) * b - a);
}

int _untilTwo(int n) {
  return n == 0 ? 0 : 1;
}

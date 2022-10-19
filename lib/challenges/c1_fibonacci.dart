//
List<int> buildFibonacciSequence(int iterations, [int start = 0]) {
  final sequence = <int>[];
  for (var n = start; n < iterations; n++) {
    sequence.add(fibonacci(n));
  }
  print(sequence);
  return sequence;
}

int fibonacci(int n) {
  if (n <= 2) return _untilTwo(n);
  return fibonacci(n - 1) + fibonacci(n - 2);
}

int _untilTwo(int n) {
  return n == 0 ? 0 : 1;
}

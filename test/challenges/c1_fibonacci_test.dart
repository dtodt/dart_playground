import 'package:dart_playground/lib.dart';
import 'package:test/test.dart';

void main() {
  test('should result 8', () async {
    expect(fibonacci(6), equals(8));
  });

  test('should build the sequence correctly', () {
    final sequence = buildFibonacciSequence(10);
    expect(sequence, equals([0, 1, 1, 2, 3, 5, 8, 13, 21, 34]));
  });
}

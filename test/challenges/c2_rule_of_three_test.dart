import 'package:dart_playground/lib.dart';
import 'package:test/test.dart';

void main() {
  test('should result 50.0', () async {
    final x = ruleOfThree(a: 14, b: 100, c: 7);
    expect(x, equals(50.0));
  });
}

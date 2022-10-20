import 'package:dart_playground/lib.dart';
import 'package:test/test.dart';

void main() {
  test('should be invalid', () async {
    expect(validateCPF('050.087.420-85'), isFalse);
  });

  test('should be valid', () async {
    expect(validateCPF('883.693.590-78'), isTrue);
  });
}

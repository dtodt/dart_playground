//
double ruleOfThree({
  required double a,
  required double b,
  required double c,
}) {
  print('''
$a\t->\t$b

$c\t->\tx
  ''');
  final result = (b * c) / a;
  print('x = $result');
  return result;
}

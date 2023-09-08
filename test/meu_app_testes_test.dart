import 'package:meu_app_testes/meu_app_testes.dart' as my_tests;
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(my_tests.calculate(), 42);
  });

  test('Testar se o valor recebido não é vazio', () {
    expect(my_tests.vazio(""), true);
  });

  test('Testar conversão para uppercase', () {
    expect(my_tests.convertToUpper("dio"), equals("DIO"));
  });

  test('Testar conversão para uppercase teste 2', () {
    expect(my_tests.convertToUpper("dio"), equalsIgnoringCase("dio"));
  });
}

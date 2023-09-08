import 'package:meu_app_testes/classes/viacep.dart';
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

  test('Valor maior que 50', () {
    expect(my_tests.retornaValor(50), greaterThanOrEqualTo(50));
  });

  test('Começa com', () {
    expect(my_tests.convertToUpper("dio"), startsWith("D"));
  });

  test('Valor diferente', () {
    expect(my_tests.retornaValor(50), isNot(equals(49)));
  });

  test('Retornar CEP', () async {
    ViaCEP viacep = ViaCEP();
    var body = await viacep.retornarCEP("01001000");
    expect(body["bairro"], equals("Sé"));
    expect(body["logradouro"], equals("Praça da Sé"));
  });
}

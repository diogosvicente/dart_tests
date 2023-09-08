import 'package:meu_app_testes/classes/viacep.dart';
import 'package:meu_app_testes/meu_app_testes.dart' as my_tests;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'meu_app_testes_test.mocks.dart';

@GenerateMocks([MockViaCEP])
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
    MockMockViaCEP mockMockViaCEP = MockMockViaCEP();
    when(mockMockViaCEP.retornarCEP("01001000"))
        .thenAnswer((realInvocation) => Future.value({
            "cep": "01001-000",
            "logradouro": "Praça da Sé",
            "complemento": "lado ímpar",
            "bairro": "Sé",
            "localidade": "São Paulo",
            "uf": "SP",
            "ibge": "3550308",
            "gia": "1004",
            "ddd": "11",
            "siafi": "7107"
          }));

    var body = await mockMockViaCEP.retornarCEP("01001000");
    expect(body["bairro"], equals("Sé"));
    expect(body["logradouro"], equals("Praça da Sé"));
  });
}

class MockViaCEP extends Mock implements ViaCEP {}

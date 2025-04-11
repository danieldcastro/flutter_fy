## 🔍 CpfValidator – Validação de CPF

### 📖 Descrição

A classe `CpfValidator` é uma **ferramenta utilitária** desenvolvida para realizar a validação do CPF de forma simples e confiável. Ela trata da remoção de formatações indesejadas e aplica algoritmos específicos para o cálculo dos dígitos verificadores, garantindo que o CPF informado atende aos requisitos legais e de integridade. Essa abordagem ajuda a prevenir cadastros inválidos e facilita a integração com sistemas que dependem da verificação de CPFs.

### 🔧 Estrutura e Componentes

#### Atributos e Constantes

- **blacklist**:  
  Uma lista que contém CPFs conhecidos como inválidos (ex.: sequências repetidas e o CPF "12345678909").

- **cpfLength**:  
  Constante que define o número esperado de dígitos do CPF (11 dígitos).

- **stripRegex**:  
  Expressão regular utilizada para remover quaisquer caracteres que não sejam dígitos, tornando o CPF apto para a validação.

#### Métodos Principais

| Método                                                 | Retorno  | Descrição                                                                                                                                                                              |
| ------------------------------------------------------ | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `_verifierDigit(cpf: String)`                          | `int`    | **Privado:** Calcula cada dígito verificador do CPF utilizando o algoritmo padrão.                                                                                                     |
| `strip(cpf: String)`                                   | `String` | Remove caracteres não numéricos, retornando apenas os dígitos do CPF.                                                                                                                  |
| `isValid(cpf: String, [stripBeforeValidation = true])` | `bool`   | Valida o CPF fazendo as seguintes verificações: <br> - Se possui 11 dígitos; <br> - Se não consta na blacklist; <br> - Se os dígitos verificadores calculados batem com os informados. |

### 🧩 Funcionamento Interno

1. **Limpeza e Formatação**  
   Através do método `strip`, a classe remove todos os caracteres não numéricos, permitindo validar entradas formatadas (como “123.456.789-09”) ou sem formatação.

2. **Cálculo dos Dígitos Verificadores**  
   O método `_verifierDigit` converte a string do CPF em uma lista de inteiros e multiplica cada dígito pelo peso correspondente (baseado na posição) para computar o dígito verificador. Se o resultado do cálculo for inferior a 2, o dígito adotado é 0; caso contrário, é 11 menos o resultado do módulo 11.

3. **Validação Final**  
   O método `isValid` executa os seguintes passos:
   - Limpa o CPF, se necessário.
   - Verifica se o CPF possui a quantidade correta de dígitos e se não está presente na blacklist.
   - Separa os números sem os dois dígitos verificadores, calcula cada dígito e os concatena para comparar com o CPF original.
   - Retorna `true` para CPFs válidos ou `false` para casos inválidos.

### 🧪 Exemplo de Uso

```dart
void main() {
  final validCpf = '935.411.347-80';
  final invalidCpf = '111.111.111-11';

  if (CpfValidator.isValid(validCpf)) {
    print('CPF válido: $validCpf');
  } else {
    print('CPF inválido: $validCpf');
  }

  if (CpfValidator.isValid(invalidCpf)) {
    print('CPF válido: $invalidCpf');
  } else {
    print('CPF inválido: $invalidCpf');
  }
}
```

### 📌 Considerações Finais

- **Utilidade:**  
  Essencial para sistemas que exigem a validação de CPF, evitando cadastros incorretos e facilitando a conformidade com as regras de negócio.

- **Robustez:**  
  Os algoritmos e verificações implementados garantem que apenas CPFs válidos sejam aceitos, contribuindo para a integridade dos dados.

- **Integração Fácil:**  
  Por meio do uso de métodos estáticos, a classe pode ser utilizada diretamente sem a necessidade de instanciar objetos, simplificando sua incorporação em diferentes partes do sistema.

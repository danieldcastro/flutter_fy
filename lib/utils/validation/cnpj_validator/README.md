## 🔍 CnpjValidator – Validação de CNPJ

### 📖 Descrição

A classe `CnpjValidator` é uma **ferramenta utilitária** que oferece métodos para validar CNPJs de forma simples e eficaz. Ela trata a formatação, remove caracteres indesejados e realiza a verificação dos dígitos verificadores, assegurando que o número informado atende aos padrões esperados. Essa abordagem minimiza erros em cadastros e integrações com sistemas que dependem da validade do CNPJ.

### 🔧 Estrutura e Componentes

#### Atributos e Constantes

- **blacklist**:  
  Uma lista com CNPJs inválidos conhecidos, que não devem ser aceitos mesmo se passarem na verificação dos dígitos.

- **cnpjLength**:  
  Constante que define o tamanho padrão do CNPJ (14 dígitos).

- **stripRegex**:  
  Expressão regular usada para remover caracteres não numéricos da string informada.

#### Métodos Principais

| Método                                                  | Retorno  | Descrição                                                                                                                                                                |
| ------------------------------------------------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `_verifierDigit(cnpj: String)`                          | `int`    | **Privado:** Calcula o dígito verificador do CNPJ com base em um algoritmo reverso.                                                                                      |
| `strip(cnpj: String)`                                   | `String` | Remove todos os caracteres não numéricos do CNPJ.                                                                                                                        |
| `isValid(cnpj: String, [stripBeforeValidation = true])` | `bool`   | Realiza a validação do CNPJ verificando: <br> - Se o valor possui 14 dígitos, <br> - Se o CNPJ não está na blacklist, <br> - Se os dígitos verificadores estão corretos. |

### 🧩 Funcionamento Interno

1. **Formatação e Limpeza**  
   O método `strip` utiliza uma expressão regular para filtrar e remover quaisquer caracteres que não sejam dígitos. Isso possibilita que o CNPJ seja validado mesmo quando passado com formatação (como “12.345.678/0001-95”).

2. **Cálculo dos Dígitos Verificadores**  
   O método `_verifierDigit` realiza o cálculo dos dígitos verificadores utilizando o algoritmo convencional:  
   - Inicia com um índice de multiplicação (inicialmente 2) e soma os produtos dos dígitos em ordem reversa.  
   - Ajusta o índice conforme necessário (reinicia para 2 após atingir 9).  
   - Aplica uma regra condicional com base no módulo 11 para retornar o dígito esperado.

3. **Validação Final**  
   No método `isValid` são realizadas as seguintes checagens:  
   - Verifica se a string está vazia ou tem comprimento diferente de 14.  
   - Confere se o CNPJ não está presente na blacklist.  
   - Calcula e compara os dígitos verificadores com os dígitos informados no final do número.

### 🧪 Exemplo de Uso

```dart
void main() {
  final validCnpj = '12.345.678/0001-95';
  final invalidCnpj = '11111111111111';

  // Remove formatação e realiza validação
  if (CnpjValidator.isValid(validCnpj)) {
    print('CNPJ válido: $validCnpj');
  } else {
    print('CNPJ inválido: $validCnpj');
  }

  if (CnpjValidator.isValid(invalidCnpj)) {
    print('CNPJ válido: $invalidCnpj');
  } else {
    print('CNPJ inválido: $invalidCnpj');
  }
}
```

### 📌 Considerações Finais

- **Utilidade:**  
  Ideal para aplicações que precisam validar o CNPJ antes de efetuar cadastros ou sincronizações com bases de dados externas.

- **Robustez:**  
  O algoritmo de verificação e as constantes (como a blacklist e o comprimento esperado) garantem que somente CNPJs genuínos sejam aceitos.

- **Facilidade de Integração:**  
  Métodos estáticos facilitam a utilização da classe sem a necessidade de instanciar objetos, simplificando sua integração em diversos contextos do seu código.
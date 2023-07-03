# Matheus Fusco - Desafio Banco Safra - Kaspper

Repositório com o código referente ao desafio proposto para a vaga de iOS no Banco Safra - Kaspper.

# Setup

Solução adotada para gerenciador de dependência: `Cocoapods`
- Manual de instalação em [link](https://cocoapods.org).
- Entrar na pasta via terminal .../TesteiOSV2/MyBankApp/ e rodar o comando `pod install`
- Após a instalação, rodar o comando `open MyBankApp.xcworkspace`
- PS: Acabei não utilizando nenhuma dependência (pelo menos por enquanto), deixei o mais nativo possível, incluindo na parte de chamadas

# Como rodar

- Após a abertuda o `MyBankApp.xcworkspace`, rodar o app com o comando `Command + R`
- PS: Para que a navegação funcione corretamente, no arquivo `LoginInteractor` é necessário descomentar a linha 19, e comentar as linhas 21 até 32. Motivo: Não consegui fazer a API de Login funcionar, então deixei a linha 19 pra fins de navegação do aplicativo

# Testes

Solução adotada para os testes unitários: `XCTests`
Solução adotada para testes de UI: `SnapshotTesting`
- Após a abertura do projeto, rodar `Command + U`

## Observações

- Testes referentes a `Home` ainda não foram finalizados, constando somente o teste da `HomeService`
- Testes referentes a tela de `Login` foram todos finalizados, incluindo todas camadas da arquitetura
- Testes das camadas de `Network` foram todos finalizados
- Para que os testes funcionem corretamente, no arquivo `LoginInteractor` é necessário comentar a linha 19, e descomentar as linhas 21 até 32. Motivo: Não consegui fazer a API de Login funcionar, então deixei a linha 19 pra fins de navegação do aplicativo

# Observações Gerais

- Nunca havia utilizado a arquitetura CleanSwift, espero que tenha feito um bom código
- A API de Login não estava funcionando, defini um retorno `LoginResponse` e seus respectivos campos e utilizei um mock para apresentar a tela `Home`
- A API de `/statements` não funcionava com o `/{id}` no final, então modifiquei a URL para igual a collection enviada para que funcionasse o retorno (sem o `/{id}` no final)

# Próximos passos

- Finalizar os testes referente a `Home`, incluindo testes unitários
- Ajustar validação dos campos de texto e retornos exibidos ao usuário
- Adicionar `Loading` tanto na tela de `Login` quanto na `Home` e tratar possíveis cenários de erro na tela
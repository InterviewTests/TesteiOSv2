# **DESAFIO Satander IBM - FElipe Perius**

Objetivo do projeto é testar os conhecimentos do canditado sobre a estrutura Clean e consumo assíncrono de APIs, testes e habilidades para construção de aplicativos para plataforma iOS .

## Começando
Estas instruções irão levá-lo a uma cópia do projeto em funcionamento em sua máquina local para fins de desenvolvimento e teste.

### Pré-requisitos
O que você precisa para construir, executar e testar o aplicativo:
Xcode 9.0 ou posterior. 
O Deployment target está configurando pra suporta iOS 9.0 ou posterior.
Clone o repositório em sua máquina local:
```
git clone https://github.com/feliperius/teste_IN3_iOS.git
```
Em seguida, abra o projeto no Xcode:
open TesteiOSv2.xcodeproj Agora você está pronto para começar.


### Uso de dependências

Nesse projeto utilizei 4 dependecias:
* Utilizei o  [Alamofire](https://github.com/Alamofire/Alamofire) para facilitar as requisições com API .
* [KeychainSwift](https://github.com/evgenyneu/keychain-swift) para salva com segurança os dados do usuario.

* [RxSwift](https://github.com/ReactiveX/RxSwift) para fazer o parse dos models do JSON e comecei usando codable mas resolvi usar ObjectMapper mesmo.

* [ObjectMapper](https://github.com/tristanhimmelman/ObjectMapper) para fazer as requisições na camada de serviço com programção reativa.

### # Observações gerais

O projeto possui testes unitarios e teste de UI . Foi feita a internacionalização para Português e inglês mas só na mensagens de erro pois objetivo é demonstrar conhecimento. Foi utilizado progamação reativa também no projeto com RxSwift. 


### Autor 
- **Felipe Augusto Pimentel Perius**

# Show me the code

Esse repositório contem todo o material necessário para realizar o teste: 
- A especificação do layout está na pasta 'bank_app_layout' abrindo o index.html, os icones estão na pasta 'assets'

- Os dados da Api estão mockados, os exemplos e a especificação dos serviços (login e statements) se encontram no arquivo BankApp.postman_collection.json ( é necessário instalar o postman e importar a colection https://www.getpostman.com/apps)

![Image of Yaktocat](https://github.com/SantanderTecnologia/TesteiOSv2/blob/master/telas.png)

### # DESAFIO:

Na primeira tela teremos um formulario de login, o campo user deve aceitar email ou cpf,
o campo password deve validar se a senha tem pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico.
Apos a validação, realizar o login no endpoint https://bank-app-test.herokuapp.com/api/login e exibir os dados de retorno na próxima tela.
O ultimo usuário logado deve ser salvo de forma segura localmente, e exibido na tela de login se houver algum salvo. 

Na segunda tela será exibido os dados formatados do retorno do login e será necessário fazer um segundo request para obter os lançamentos do usuário, no endpoint https://bank-app-test.herokuapp.com/api/statements/{idUser} que retornará uma lista de lançamentos

### # Avaliação

Você será avaliado pela usabilidade, por respeitar o design e pela arquitetura do app. É esperado que você consiga explicar as decisões que tomou durante o desenvolvimento através de commits.

Obrigatórios:

* Swift 3.0 ou superior
* Autolayout
* O app deve funcionar no iOS 9
* Testes unitários, pode usar a ferramenta que você tem mais experiência, só nos explique o que ele tem de bom.
* Arquitetura a ser utilizada: Swift Clean ([https://clean-swift.com/handbook/](https://clean-swift.com/handbook/) && [https://github.com/Clean-Swift/CleanStore](https://github.com/Clean-Swift/CleanStore)
* Uso do git.

### # Observações gerais

Adicione um arquivo [README.md](http://README.md) com os procedimentos para executar o projeto.
Pedimos que trabalhe sozinho e não divulgue o resultado na internet.

Faça um fork desse desse repositório em seu Github e ao finalizar nos envie um Pull Request com o resultado, por favor informe por qual empresa você esta se candidatando.

# Importante: não há prazo de entrega, faça com qualidade!

# BOA SORTE!

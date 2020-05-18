### # Hugo Ferreira (IBM) - Santander Challenge

# Sobre o DESAFIO:

Na primeira tela teremos um formulario de login, o campo user deve aceitar email ou cpf,
o campo password deve validar se a senha tem pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico.
Apos a validação, realizar o login no endpoint https://bank-app-test.herokuapp.com/api/login e exibir os dados de retorno na próxima tela.
O ultimo usuário logado deve ser salvo de forma segura localmente, e exibido na tela de login se houver algum salvo. 

Na segunda tela será exibido os dados formatados do retorno do login e será necessário fazer um segundo request para obter os lançamentos do usuário, no endpoint https://bank-app-test.herokuapp.com/api/statements/{idUser} que retornará uma lista de lançamentos


# (STATUS) Itens Obrigatórios

* Swift 3.0 ou superior -- OK
* Autolayout -- Ok
* O app deve funcionar no iOS 9 -- OK
* Arquitetura a ser utilizada: Swift Clean ([https://clean-swift.com/handbook/](https://clean-swift.com/handbook/) && [https://github.com/Clean-Swift/CleanStore](https://github.com/Clean-Swift/CleanStore) - OK
* Uso do git. -- OK
* Testes unitários, pode usar a ferramenta que você tem mais experiência, só nos explique o que ele tem de bom. -- LOADING...

# Cocoapods

Fiz o projeto sem uso de biblioteca de terceiros ex: Alamofire e SwiftyJSON
No lugar dessas fiz as request com URLSession e JSON Decoder com Decodable para parsear


# Config

Não existe dependências de terceiros, para configurar abra o projeto no Xcode e ctrl + R



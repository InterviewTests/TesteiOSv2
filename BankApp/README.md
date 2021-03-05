#**AppBank** 
##*Processo seletivo para desenvolvedor iOS - Accenture.*

* Devido a presença de pods no projeto, é necessário abrir o arquivo **BankApp.xcworkspace** ao invés de **BankApp.xcodeproj**.

* Foi utilizado o framework **Quick** em conjunto com o **Nimble** para testes, por ser mais intuitivo para implementar e analisar os resultados do teste, já que com as características do **Nimble** é possivel utilizar interface fluente.



## Observações: 
* A API apresenta algumas informações de forma ambigua: o retorno da requisição de login traz o balanço atual do usuário em formato brasileiro (ou seja, com **ponto** para separar as **casas de milhar**), em contrastre com o retorno da requisição da tela de extrato, o qual apresenta o valor de cada extrato no formato americano (ou seja, **ponto** para representar **centavos** e **vírgula** para representar **milhar**).

* No retorno da requisição de login, os dados do cliente relativos a conta (**bankAccount** e **agency**) estão invertidos: normalmente, a agência é o número menor e a conta é o número maior.



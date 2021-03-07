#**AppBank** 
##*Processo seletivo para desenvolvedor iOS - Accenture.*

* Devido a presença de pods no projeto, é necessário abrir o arquivo **BankApp.xcworkspace** ao invés de **BankApp.xcodeproj**.

* Foi utilizado o framework **Quick** em conjunto com o **Nimble** para testes, por ser mais intuitivo para implementar e analisar os resultados do teste, já que com as características do **Nimble** é possivel utilizar interface fluente.



## Observações: 
* No retorno da requisição de login, os dados do cliente relativos a conta (**bankAccount** e **agency**) estão invertidos: normalmente, a agência é o número menor e a conta é o número maior.

* A especificação de layout não pode ser seguida de forma fiel, pois assim alguns textos provenientes da API ficam "cortados" (por exemplo, na *label* de descrição das operações do cliente do banco, o texto "conta de telefone" fica como "conta de telef....").

* Mesmo não estando nas descrições de *layout* do projeto, tomei a liberdade de , no extrato do cliente, indicar em vermelho os débitos.


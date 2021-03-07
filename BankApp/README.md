# **AppBank** 
## *Processo seletivo para desenvolvedor iOS - Accenture.*

## Setup:
* Devido a presença de pods no projeto, é necessário abrir o arquivo **BankApp.xcworkspace** ao invés de **BankApp.xcodeproj**.
* Foi utilizado o framework **Quick** em conjunto com o **Nimble** para testes, por ser mais intuitivo para implementar e analisar os resultados do teste, já que com as características do **Nimble** é possivel utilizar interface fluente.



## Observações: 

* No retorno da requisição de login, os dados do cliente relativos a conta (**bankAccount** e **agency**) estão invertidos: normalmente, a agência é o número menor e a conta é o número maior.

* A especificação de layout não pode ser seguida de forma fiel, pois assim alguns textos provenientes da API ficam "cortados" (por exemplo, na *label* de descrição das operações do cliente do banco, o texto "conta de telefone" fica como "conta de telef....").

* Mesmo não estando nas descrições de *layout* do projeto, tomei a liberdade de , no extrato do cliente, indicar em vermelho os débitos.

* Optei por seguir as especificações numéricas do *layout*, mesmo que o mesmo tenha ficado ligeiramente diferente (visualmente) do que está no arquivo de exemplo. 

* Devido a presença das validações solicitadas nos campos de texto, o login com o usuário "test_user" não vai funcionar. Uma sugestão é utilizar um CPF válido (com ou sem pontos) ou um endereço de email (por sua vez, a senha "Test@1" vai funcionar pois está dentro do padrão exigido).

INSTRUÇÕES PARA EXECUÇÃO
- Para rodar o app, abrir o projeto TesteiOSv2 no XCode 10.1, escolher um Simulador com iOS 9 ou superior e teclar Command R.

ESTRUTURA DO PROJETO
- O projeto segue a estrutura sugerida pelo CleanSwift e tem duas cenas: Login e Extrato.
- Cada cena possui sua estrutura de arquivos de acordo com a arquitetura CleanSwift (View Controller, Interactor, Model, Worker, Presenter e Router).
- API de chamada de serviço está na pasta Services
- Extensões, constantes e métodos compartilhados estão na pasta Shared
- Storyboards e Assets estão na pasta Assets

ARQUITETURA DO APP
- O app segue a arquitetura CleanSwift. Por conta disso, as responsabilidades ficaram bem distribuídas entre os diferentes componentes do app. Por exemplo:
1) a ViewController ficou com a responsabilidade de controle de interação do usuário (botões, listas e mensagens) e exibição dos dados enviados pelas Presenters.
2) regras de negócio (por exemplo, a orquestração das três regras de validação de login) foram implementadas nas Interactors.
3) as chamadas de serviço e funções especializadas ficaram nas Workers.
4) a formatação de dados (por exemplo: data e valor no extrato) ficaram sob responsabilidade da Presenter.
- A estruturação exigida pelo CleanSwift requer do desenvolvedor um planejamento prévio que pode ter como ponto de partida o use case. A própria estrutura da arquitetura CleanSwift organiza o desenvolvimento e isso contribui com a redução da quantidade de bugs durante a etapa de desenvolvimento.

TESTES UNITÁRIOS
- Outro benefício da arquitetura CleanSwift foi a testabilidade. Foram escritos cenários de testes unitários para todos os 4 componentes: Interactor, Worker, Presenter e View Controller.
- Durante a construção e execução dos cenários de teste encontrei 2 bugs no app.
- Também foram escritos scripts de testes de UI que focaram na existência dos componentes de UI especificados no arquivo sketch e no funcionamento esperado do app.


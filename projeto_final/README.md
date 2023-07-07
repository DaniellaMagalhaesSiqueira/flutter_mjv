# projeto_final

Projeto desafio para aplicação das tecnologias aprendidas na School de Flutter promovida pela MJV Tecnologia e Inovação.
Julho/2023

## Criação do Projeto

Projeto criado pelo terminal com o comando flutter create <nomedoprojeto>

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

Dependências instaladas com o comando flutter pub add <nomedadependencia>
[online documentation](https://docs.flutter.dev/)


## Criação de navegação

A navegação é feita pelo componente MenuBarComponent que recebe apenas um parâmetro boleano que indica se ele é a página inicial. Foi feita a classe appRoutes e um provider para as rotas também. O acesso foi feito utilizando o Navigator.pushReplacementNamed, pois a página será substituída ao invés de incrementada para dar mais controle à navegação.
Optei por utilizar provider para passar uma receita selecionada para outra página. Como o provider se mantinha ao retornar à página inicial foi necessário o tratamento da variável recipeSelected transformando-a em null ao retornar para a home page.
'''dart
IconButtonComponent(
    icon: Icons.arrow_circle_left_outlined,
    onPressed: () {
        final store = Provider.of<RecipeProvider>(context, listen: false);
        store.recipeSelected = null;
        navegar(context, AppRoutes.initialRoute);
    },
),
'''
Além do tratamento na classe MenuBarComponent também foi necessário o tratamento na própria classe FormPage quando um item que já existe é salvo, pois a variável recipeSelected está preenchida e precisa ser esvaziada para que quando o usuário navegue para uma página de nova receita após voltar de uma edição possa ter a página vazia com a variável isEdit false.

## Formulário

A página do formulário tem apenas a tarefa de administrar os dados para edição e adição de uma nova receita. Como sua tarefa era apenas essa, não foi componentizado o widget Form. Caso uma receita seja selecionada ao chegar nessa página a classe recebe a variável isEdit no setInitialState bem como o provider que irá alimentar a variável recipe. Caso não seja uma página de edição ela será carregada sem os dados para uma nova receita.
Também vi que existe o Consumer, mas por falta de tempo para experimentar outras formas de preenchimento do formulário não me aprofundei nessa possibilidade.


![Minha imagem](/lib/assets/teste.png)

## Providers

Foram criados providers para o auxílio ao armazenamento com os notifiers e para transporte de objetos ou variáveis entre as páginas navegáveis facilitando a manutenção do aplicativo caso esse venha a precisar de novas páginas e incrementos.

## Imagem

A princípio pensei em desenvolver como o professor fez usando a imagem que altera logo na tela, mas optei por deixar todas as funções de manipulação da imagem dentro do componente BoxImageComponent criando para isso uma referência à imagem no provider para melhor manipular na página de formulário. 
A dificuldade foi administrar quando entrava na página de formulário e não atualizava a foto, foi importante tratar quando a foto voltava sem um store.image preenchido, pois salvava uma imagem vazia quando não alterava.

## Temas e Estilização

Foi criada a classe abstrata PaletteStyle para que um conjunto de atributos possa ser reproduzidos nas classes de temas. Ao invés do tema dark e light tradicional optou-se pelo uso dos temas em determinados momentos ao editar e ver detalhes baseando as cores de uma receita em sua categoria.
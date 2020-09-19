Feature: list pokemons
Como um usuário
Quero conseguir visualizar uma lista de pokemons

Cenário: Falha ao carregar a lista
Dado que a lista falhou ao ser carregada
Quando carregar a tela de listagem de pokemons
Então o sistema deve informar uma mensagem de error

Cenário: Sucesso ao carregara a lista
Dado que o sistema carregou com sucesso a lista
Quando carregar a tela de listagem de pokemons
Então Os pokemons devem estar listados por id
E o background deve respeitar as cores do universo pokemon

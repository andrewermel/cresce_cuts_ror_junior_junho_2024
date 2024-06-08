Store Management System
Um sistema de gerenciamento de lojas construído com Ruby on Rails. Este aplicativo permite que os usuários gerenciem lojas, clientes, pedidos e itens.

Indice
 - Recursos
 - Instalação
 - Uso
 - Rodando Testes
 - Contribuição
 - Licença

 Recursos
 - Gerenciamento de lojas com detalhes como nome, descrição e endereço
 - Gerenciamento de clientes com detalhes como nome, e-mail e endereço
 - Criação e gerenciamento de pedidos associados a clientes e lojas
 - Gerenciamento de itens e itens de pedidos

 Instalação
 Pré-requisitos
 Certifique-se de ter os seguintes softwares instalados:

 - Ruby (versão 2.7.0 ou superior)
 - Rails (versão 6.0 ou superior)
 - PostgreSQL

 Configuração (rodar no terminal)
  git clone https://github.com/seu-usuario/store-management-system.git
  cd store-management-system

instalações de dependencias
  - bundle install

configurando o banco de dados

  - rails db:create
  - rails db:migrate
  - rails db:seed

inicie o servidor

 - rails s

http://localhost:3000

Rodando Testes
Execute a suíte de testes usando o RSpec:

 - rspec (rodar no terminal para rodar todos os testes)

=============================================================

 Manipulação de Dados via Console

 Acessando o Console do Rails
 Para abrir o console do Rails, use o seguinte comando:

  - rails console

 Exemplos de Comandos
 Criar uma nova loja:
  - Store.create(name: "New Store", description: "A new store description", address: "456 Another St")

 Listar todas as lojas:
  - Store.all

 Encontrar uma loja por ID:
  - Store.find(1)

 Atualizar uma loja:
  store = Store.find(1)
  store.update(name: "Updated Store Name")

 Deletar uma loja:
  store = Store.find(1)
  store.destroy

 Criar um novo cliente:
  Customer.create(name: "Jane Doe", email: "jane@example.com", address: "789 Different St")

 Listar todos os clientes:
  Customer.all

 Criar um novo pedido:
  order = Order.create(customer_id: 1, store_id: 1, status: "pending", total: 100.0)

 Adicionar um item a um pedido:
  order = Order.find(1)
  item = Item.find(1)
  order.order_items.create(item: item, quantity: 2, price: item.price)



================================================================================

# Desafio Prático em Ruby on Rails

## Objetivo
O objetivo deste desafio é avaliar suas habilidades em Ruby on Rails para desenvolver uma aplicação backend que gerencie o fluxo de pedidos em um sistema de e-commerce. Você deve implementar modelos, associações, validações e o fluxo de alteração de status dos pedidos, focando na manipulação de dados via console do Rails.

## Requisitos Funcionais
1. **Modelos:**
   - **Loja:** Deve ter um nome, descrição e endereço.
   - **Cliente:** Deve ter um nome, e-mail (com validação de unicidade) e endereço.
   - **Pedido:** Deve ter uma data de criação, total do pedido e status (pendente, em separação, confirmado, em rota, disponível para retirada).
   - **Item:** Deve ter um nome, descrição, preço e quantidade em estoque.
   - **Carrinho:** Deve pertencer a um cliente e conter múltiplos itens.

2. **Associações:**
   - Um pedido pertence a um cliente e a uma loja.
   - Um pedido tem muitos itens.
   - Um carrinho pertence a um cliente.
   - Um carrinho tem muitos itens.

3. **Fluxo de Status do Pedido:**
   - **Pendente:** O administrador da loja aceita o pedido, alterando o status para "em separação".
   - **Em Separação:** A separação dos itens do pedido é feita. Todos os itens devem ser marcados como separados (presentes) para o status evoluir para "confirmado".
   - **Confirmado:** O pagamento do pedido é realizado. O status do pedido é alterado para "em rota" ou "disponível para retirada".

4. **Funcionalidades:**
   - CRUD completo para Loja, Cliente, Pedido, Item e Carrinho via console do Rails.
   - Validações adequadas para todos os campos (ex.: presença, formato, etc.).
   - Testes com RSpec.

## Requisitos Não Funcionais
- Aderência às boas práticas do Ruby on Rails e padrões de código.
- Utilização de migrações para criação de tabelas e mudanças no banco de dados.
- Uso de seeds para popular o banco de dados com dados iniciais.
- Documentação básica de como rodar a aplicação (README.md).

## Submissão
1. Faça um fork do repositório do desafio (um link para o repositório deve ser fornecido).
2. Implemente a solução.
3. Envie um pull request com sua implementação.
4. Inclua um arquivo README.md com as instruções para configurar e rodar a aplicação localmente, bem como qualquer outra informação relevante.

## Orientações Adicionais
- Cada candidato deve criar sua branch sendo seu nome completo (exemplo: rafael_tomaz_parreira).
- Cada candidato deve criar seu próprio Pull Request (PR) para avaliação da implementação.
- Todas as operações de criação, leitura, atualização e exclusão devem ser realizadas via console do Rails.
- Inclua exemplos de comandos no README.md para guiar o usuário em como manipular os dados via console.
- Utilize seeds para criar dados iniciais que possam ser usados para testar a aplicação.
- A aplicação deve seguir os padrões de codificação do Ruby on Rails e ser bem organizada.

## Suporte
Se tiver dúvidas durante o desenvolvimento, por favor, entre em contato através do e-mail [rafael@crescevendas.com](mailto:rafael@crescevendas.com).

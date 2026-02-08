Estrutura baseado em: https://docs.docker.com/guides/frameworks/laravel/production-setup/ e https://laravel.com/docs/12.x

## Como Rodar

1. Inicie os containers:

   ```bash
   docker compose up
   ```
2. Acesse o container de workspace:

   ```bash
   docker exec -it farmaciaonline-workspace bash
   ```
3. Instale as dependências do Composer:

   ```bash
   composer install
   ```
4. Execute as migrações:

   ```bash
   php artisan migrate
   ```

## Funcionalidades do Backend

1. [X] **Cadastrar produtos** - `POST /api/products`

    - Validação: nome, preço e tipo obrigatórios
    - Mensagens de erro personalizadas em inglês

2. [X] **Listar produtos com paginação** - `GET /api/products`

    - Paginação de 15 itens por página
    - Retorna metadados de paginação (total, per_page, current_page, etc.)

3. [X] **Atualizar produtos** - `PUT/PATCH /api/products/{id}`

    - Validação com campos opcionais (usando `sometimes`)
    - Route Model Binding para buscar produto automaticamente

4. [X] **Buscar produto por nome** - `GET /api/products?search=nome`

    - Busca parcial (LIKE) no campo `name`
    - Funciona com paginação
    - Usa `when()` para aplicar filtro condicionalmente

5. [X] **Autenticação de usuário**

    - Criar usuário
    - Login e Logout
    - Proteger rotas com middleware de autenticação

6. [X] **Filtros e ordenação na listagem**

    - Filtrar por tipo: `GET /api/products?type=medication`
    - Ordenar por nome ou preço: `GET /api/products?sort_by=name&sort_order=asc`
    - Parâmetros de ordenação: `sort_by` (name, price) e `sort_order` (asc, desc)
    - Combina com busca e paginação
    - Validação de colunas permitidas para segurança

### Validações Implementadas

- **Nome**: obrigatório, string, máximo 255 caracteres
- **Preço**: obrigatório, numérico, mínimo 0
- **Tipo**: obrigatório, deve ser um dos valores: `medication`, `vitamin`, `supplement`, `hygiene`, `beauty`, `others`

Estrutura baseado em: [Docker - Laravel Production Setup](https://docs.docker.com/guides/frameworks/laravel/production-setup/) e [Laravel 12.x Documentation](https://laravel.com/docs/12.x)

## Funcionalidades do Backend

### Funcionalidades Obrigatórias (conforme teste)

1. [X] **Cadastrar produtos** - `POST /api/products`
   - Validação: nome, preço e tipo obrigatórios
   - Mensagens de erro personalizadas em inglês

2. [X] **Listar produtos com paginação** - `GET /api/products`
   - Paginação de 15 itens por página
   - Retorna metadados de paginação (total, per_page, current_page, etc.)

3. [X] **Atualizar produtos** - `PUT/PATCH /api/products/{id}`
   - Validação com campos opcionais (usando `sometimes`)
   - Route Model Binding para buscar produto automaticamente

### Funcionalidades Opcionais

4. [X] **Buscar produto por nome** - `GET /api/products?name=nome`
   - Busca parcial (LIKE) no campo `name`
   - Funciona com paginação
   - Usa `when()` para aplicar filtro condicionalmente

### Diferenciais (Opcional)

5. [ ] **Autenticação de usuário**
   - Criar usuário
   - Login
   - Proteger rotas com middleware de autenticação

6. [ ] **Filtros e ordenação na listagem**
   - Filtrar por tipo
   - Ordenar por nome, preço, etc.

### Validações Implementadas

- **Nome**: obrigatório, string, máximo 255 caracteres
- **Preço**: obrigatório, numérico, mínimo 0
- **Tipo**: obrigatório, deve ser um dos valores: `medication`, `vitamin`, `supplement`, `hygiene`, `beauty`, `others`

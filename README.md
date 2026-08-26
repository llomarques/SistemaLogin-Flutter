# Sistema de Login Flutter

Aplicação mobile/desktop desenvolvida em Flutter para autenticação de usuários, cadastro e navegação entre telas de login, cadastro e home.

## Visão geral

Este projeto simula um sistema de login com interface em Flutter e comunicação com uma API backend, utilizando `http` para enviar requisições para um servidor local.

A aplicação contém:

- Tela de login
- Tela de cadastro de usuário
- Home após autenticação bem-sucedida
- Validações de formulário
- Feedback visual por meio de SnackBar
- Conexão com backend via HTTP

## Tecnologias

- Flutter
- Dart
- HTTP
- Material 3

## Estrutura do projeto

```text
sistemaloginflutter/
├── android/                  # Projeto Android
├── lib/
│   ├── main.dart             # Inicialização do app
│   ├── dados_mock.dart       # Dados mockados (se usados no projeto)
│   ├── pages/
│   │   ├── login_page.dart   # Tela de login
│   │   ├── cadastro_page.dart # Tela de cadastro
│   │   └── home_page.dart    # Tela inicial autenticada
│   └── services/
│       └── api_service.dart  # Comunicação com a API
├── web/                     # Projeto web
├── windows/                 # Projeto Windows
├── analysis_options.yaml
├── pubspec.yaml
├── README.md
└── .gitignore
```

## Requisitos

Antes de rodar o projeto, certifique-se de ter instalado:

- Flutter SDK
- Dart SDK
- Android Studio ou VS Code com extensão Flutter
- Emulador Android ou dispositivo físico
- Backend em execução na porta 3000 (se o sistema depender de API externa)

## Configuração

1. Clone o repositório:

```bash
git clone <url-do-repositorio>
cd sistemaloginflutter
```

2. Instale as dependências:

```bash
flutter pub get
```

3. Verifique se o backend está disponível:

A API configurada no projeto está apontando para:

```text
http://localhost:3000
```

Os endpoints esperados são:

- `POST /login`
- `POST /usuarios`

Se o backend não estiver rodando, a autenticação e o cadastro podem falhar com mensagens de erro de conexão.

## Como executar

### Web

```bash
flutter run -d chrome
```

### Android

```bash
flutter run
```

### Em modo específico de dispositivo

```bash
flutter devices
flutter run -d <device-id>
```

## Funcionalidades principais

### Login

- Entrada de e-mail e senha
- Validação de campos vazios
- Chamada para a API de autenticação
- Redirecionamento para a tela inicial

### Cadastro

- Campos de nome, e-mail, senha e confirmação
- Verificação de e-mail válido
- Verificação de senha mínima
- Confirmação de senha
- Validação de e-mail já cadastrado
- Cadastro via API

### Home

- Exibe nome e e-mail do usuário autenticado
- Possibilidade de sair da aplicação

## Observações importantes

- O projeto usa a URL base definida em `ApiService`:

```dart
static const String baseUrl = 'http://localhost:3000';
```

- Caso esteja usando outro backend, altere esse valor conforme o endereço real da API.
- O projeto também contém dados mockados em `dados_mock.dart`, que podem ser úteis para testes locais ou desenvolvimento inicial.

## Próximos passos sugeridos

- Integrar autenticação com backend real em produção
- Criar persistência de sessão com `SharedPreferences` ou Firebase
- Adicionar paginação, menu lateral e gerenciamento de usuários
- Implementar testes automatizados
- Melhorar a experiência visual com design customizado

## Autor

Projeto desenvolvido em Flutter para estudo e demonstração de fluxo de login e cadastro.

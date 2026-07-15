# Documentação do DEVAPP

## 1. Visão Geral

**DEVAPP** é um ambiente de desenvolvimento portátil para Windows, projetado para facilitar a instalação e execução de diversas ferramentas de programação, bancos de dados e utilitários, tudo a partir de um único diretório. Ele é acionado pelo arquivo `start.bat`, que configura automaticamente as variáveis de ambiente e disponibiliza um menu interativo para gerenciar as ferramentas.

---

## 2. Pré‑requisitos

- Sistema operacional Windows (64 bits).
- Conexão com a Internet para download das ferramentas.
- Espaço em disco suficiente para os pacotes escolhidos (cada ferramenta pode ocupar de centenas de MB a alguns GB).

---

## 3. Como Executar o DEVAPP

1. Extraia todo o conteúdo do pacote DEVAPP em uma pasta de sua escolha (ex.: `C:\DEVAPP`).
2. Navegue até essa pasta e execute o arquivo **`start.bat`**.
3. O script abrirá uma janela do Prompt de Comando com um menu principal colorido.
4. Todas as ferramentas instaladas serão executadas **dentro do ambiente configurado pelo DEVAPP**, garantindo que as variáveis de ambiente (PATH, `JAVA_HOME`, `ANDROID_HOME`, etc.) estejam corretas.

> **Atenção**: Sempre execute os programas a partir do `start.bat` para que todas as variáveis sejam carregadas corretamente. Não é necessário instalar nada globalmente no sistema.

---

## 4. Estrutura de Menus

Ao iniciar, você verá o menu principal:

```
--- OPCOES --------------------------------------------
( 0 ) SAIR
( 1 ) PROGRAMAÇÃO E BANCO DE DADOS   -> Executar ferramentas instaladas
( 2 ) INSTALAÇÕES                    -> Baixar e instalar novas ferramentas
( 3 ) AUXILIARES                     -> Ferramentas online e utilitários
```

### 4.1. Submenu **PROGRAMAÇÃO E BANCO DE DADOS** (Executar)

Aqui você pode executar diretamente as ferramentas já instaladas.

| Opção | Ferramenta          | Descrição                                                                 |
|-------|---------------------|---------------------------------------------------------------------------|
| 1     | Android Studio      | IDE oficial para desenvolvimento Android.                                 |
| 2     | DBeaver             | Cliente universal para bancos de dados (SQL, NoSQL, etc.).                |
| 3     | Insomnia            | Cliente REST/GraphQL para testar APIs.                                    |
| 4     | MariaDB             | Inicia o servidor MariaDB (porta 3360, senha `SECRET`).                   |
| 5     | MongoDB             | Inicia o servidor MongoDB (porta padrão 27017, dados em `mongodb\data`).  |
| 6     | MongoSH             | Shell interativo para MongoDB.                                            |
| 7     | MySQL               | Inicia o servidor MySQL (porta 3360, usuário `root` sem senha).           |
| 8     | Neo4j               | Inicia o servidor de banco de dados de grafos (console).                  |
| 9     | NetBeans            | IDE Java com suporte a múltiplas linguagens.                              |
| 10    | Notepad++           | Editor de texto leve com realce de sintaxe.                               |
| 11    | Postgres            | Inicia o servidor PostgreSQL (porta 5439, usuário `postgres` sem senha).  |
| 12    | Postman             | Plataforma para desenvolvimento e teste de APIs.                          |
| 13    | PuTTY               | Cliente SSH/Telnet.                                                       |
| 14    | VS Code             | Editor de código da Microsoft com suporte a extensões.                    |

> **Observação**: As opções de bancos de dados (4, 5, 7, 8, 11) abrem uma janela separada com o servidor em execução. **Não feche essa janela** enquanto estiver usando o banco; ao finalizar, pressione qualquer tecla para encerrar o servidor.

### 4.2. Submenu **INSTALAÇÕES**

Aqui você pode baixar e instalar as ferramentas. Cada opção faz o download do arquivo, descompacta e (se necessário) configura a estrutura de pastas.

| Opção | Ferramenta                   | Descrição                                                                                      |
|-------|------------------------------|------------------------------------------------------------------------------------------------|
| 1     | Android Studio               | IDE completa para Android. (O SDK será usado em `DEVAPP\android\sdk`).                         |
| 2     | DBeaver                      | Cliente de banco de dados universal.                                                           |
| 3     | Flutter SDK                  | Framework para desenvolvimento mobile multiplataforma.                                         |
| 4     | Git                          | Sistema de controle de versão (portátil).                                                      |
| 5     | Gradle                       | Ferramenta de automação de builds (usado com Android/Java).                                    |
| 6     | JDK + Maven                  | Instala o JDK 21 e o Maven (gerenciador de dependências Java).                                 |
| 7     | MariaDB                      | Banco de dados relacional (fork do MySQL).                                                     |
| 8     | MongoDB                      | Banco de dados NoSQL documental (instalação MSI).                                              |
| 9     | MongoSH                      | Shell para MongoDB.                                                                            |
| 10    | MySQL                        | Banco de dados relacional.                                                                     |
| 11    | Neo4j                        | Banco de dados de grafos.                                                                      |
| 12    | NetBeans                     | IDE Java.                                                                                      |
| 13    | NetCore                      | SDK do .NET Core (inclui runtime do ASP.NET Core).                                             |
| 14    | Node + Git                   | Instala o Node.js e, em seguida, o Git.                                                        |
| 15    | Notepad++                    | Editor de texto.                                                                               |
| 16    | Postgres                     | Banco de dados relacional (PostgreSQL).                                                        |
| 17    | PuTTY                        | Cliente SSH.                                                                                   |
| 18    | Python                       | Instala o Python 3.13 (modo usuário, sem privilégios administrativos).                         |
| 19    | SDK Android CLI Básico       | Instala as ferramentas de linha de comando do Android (SDK, platform-tools, cmdline-tools).    |
| 20    | VS Code + Configurações      | Instala o VS Code e cria a estrutura de pastas (sem extensões).                                |
| 21    | Gerenciar extensões VS Code  | Abre um submenu para instalar extensões agrupadas por categoria (ver seção 4.2.1).             |

> **Importante**: A instalação do **JDK + Maven** (opção 6) já instala ambos. O **Node + Git** (opção 14) instala o Node e em seguida o Git. A opção 20 instala apenas o editor VS Code e as configurações iniciais; as extensões devem ser instaladas separadamente via opção 21.

#### 4.2.1. Submenu **GERENCIAR EXTENSÕES VS CODE**

Ao escolher a opção 21, você verá um menu com as seguintes categorias:

| Opção | Categoria                        | Extensões incluídas (principais)                                                                                   |
|-------|----------------------------------|--------------------------------------------------------------------------------------------------------------------|
| 1     | Java / Spring                    | Red Hat Java, Spring Boot, Maven, Gradle, depurador Java, etc.                                                     |
| 2     | Frontend (HTML/CSS/JS/Vue/React) | Prettier, ESLint, Auto Close/rename Tag, Live Server, Vue Volar, React snippets, SCSS, etc.                        |
| 3     | Python                           | Python e Pylance (suporte completo para Python).                                                                   |
| 4     | .NET / C#                        | C# Dev Kit, .NET Runtime, NuGet Package Manager, etc.                                                             |
| 5     | Flutter / Dart                   | Flutter e Dart (oficiais) e snippets para Flutter.                                                                 |
| 6     | Utilitários                      | GitLens, Code Spell Checker, Better Comments, Todo Tree, Markdown All-in-One, Marp, Markdown PDF, ícones, etc.     |
| 7     | Todas as extensões               | Instala todas as extensões das categorias acima (instalação completa).                                             |

Cada categoria pode ser instalada independentemente, permitindo que você escolha apenas o que realmente precisa. As extensões são instaladas no diretório `vscode\extensions` e os dados do usuário ficam em `vscode\userdir`, mantendo a portabilidade.

> **Dica**: Se você já instalou o VS Code via opção 20, pode acessar este submenu a qualquer momento para adicionar extensões indicadas conforme sua necessidade (lembrando que a opção de extensões do próprio VSCode pode ser usada).

### 4.3. Submenu **AUXILIARES**

Opções que abrem ferramentas online ou utilitários rápidos.

| Opção | Ferramenta                | Descrição                                                       |
|-------|---------------------------|-----------------------------------------------------------------|
| 1     | CMD                       | Abre um novo Prompt de Comando com as variáveis do DEVAPP.      |
| 2     | Creately                  | Ferramenta online para diagramas (colaborativa).                |
| 3     | DB Diagram                | Modelagem de banco de dados online (dbdiagram.io).              |
| 4     | Draw.IO                   | Editor de diagramas (diagrams.net).                             |
| 5     | Excalidraw                | Ferramenta para desenhos e wireframes simples.                  |
| 6     | Mermaid                   | Editor de diagramas baseados em texto (mermaid.live).           |
| 7     | Smart Draw                | Ferramenta online para diagramas ER.                            |
| 8     | Visual Paradigm Online    | Ferramenta UML e modelagem (versão gratuita).                   |
| 9     | YED Online                | Editor de grafos e diagramas (yWorks).                          |

---

## 5. Funcionalidades Avançadas

### 5.1. Configuração de Variáveis de Ambiente

O `start.bat` define automaticamente as seguintes variáveis (exemplos):

- `JAVA_HOME` → `%~dp0jdk`
- `ANDROID_HOME` → `%~dp0android\sdk`
- `FLUTTER_HOME` → `%~dp0flutter`
- `NODE_HOME` → `%~dp0node`
- `Path` → inclui todos os `bin` das ferramentas instaladas, além do PATH original do sistema.

Isso permite que você use **qualquer ferramenta** (javac, node, flutter, etc.) diretamente da linha de comando, desde que executada dentro da janela do `start.bat` ou em um CMD auxiliar (opção 1 do menu Auxiliares).

### 5.2. Estrutura de Pastas

Todas as instalações ficam dentro do diretório raiz do DEVAPP (onde está o `start.bat`). Exemplo:

```
DEVAPP\
   start.bat
   jdk\
   node\
   vscode\
      extensions\      (extensões instaladas)
      userdir\         (dados do usuário)
   flutter\
   android\
      sdk\
      android-studio\
   mysql\
   mariadb\
   pgsql\
   mongodb\
   neo4j\
   ...
```

Isso torna o ambiente **totalmente portátil** – você pode copiar a pasta inteira para outro computador e continuar usando.

### 5.3. Configuração do VS Code

- A instalação básica (opção 20) baixa e extrai o VS Code, cria a pasta `userdir` para dados do usuário e copia um `settings.json` padrão. **Nenhuma extensão é instalada automaticamente**.
- Para instalar extensões, utilize a opção 21 e escolha as categorias desejadas. As extensões ficam armazenadas em `vscode\extensions`, mantendo a portabilidade.
- O gerenciamento por categorias permite instalar apenas o necessário para o seu projeto, economizando tempo e espaço.

### 5.4. Bancos de Dados

Cada banco de dados é configurado para ser **autônomo** e não interferir com instalações existentes no sistema:

- **MySQL** e **MariaDB**: porta 3360 (para evitar conflito com a porta padrão 3306).
- **PostgreSQL**: porta 5439 (padrão é 5432). Usuário `postgres`, sem senha (autenticação `trust`).
- **MongoDB**: porta padrão 27017, dados em `mongodb\data`.
- **Neo4j**: executa em modo console (acesso via navegador em `http://localhost:7474` – usuário/senha `neo4j/neo4j` na primeira execução).

---

## 6. Dicas e Boas Práticas

- **Sempre inicie pelo `start.bat`**: Se você abrir um CMD separado e tentar executar, por exemplo, `java -version`, pode não funcionar porque as variáveis não foram carregadas.
- **Para instalar várias ferramentas de uma vez**: Execute as opções de instalação na ordem desejada. O script baixa e instala cada uma, mas não as inicia automaticamente (exceto quando a instalação termina e pede confirmação).
- **Atualizações**: Para atualizar uma ferramenta, basta rodar novamente a opção de instalação correspondente – o script substituirá a versão antiga.
- **Espaço em disco**: Algumas ferramentas (Android Studio, JDK, etc.) ocupam vários gigabytes. Certifique-se de ter espaço suficiente.
- **Uso de `wget` e `7za`**: O DEVAPP já inclui esses utilitários na pasta `wget` e `sevenzip`. Eles são usados internamente para downloads e descompactação.
- **Gerenciamento de extensões**: Use o submenu 21 para instalar apenas as extensões que você usa. Se precisar de uma extensão não listada, você pode instalá-la manualmente via linha de comando dentro do ambiente DEVAPP.

---

## 7. Solução de Problemas Comuns

| Problema                                  | Possível Solução                                                                 |
|-------------------------------------------|----------------------------------------------------------------------------------|
| "Comando não encontrado"                  | Certifique-se de estar executando o comando dentro da janela do `start.bat`.      |
| Download falha (erro de certificado)      | O script usa `--no-check-certificate` para contornar, mas verifique sua rede.    |
| Extensão não instalada no VS Code         | Execute a opção 21 e escolha a categoria desejada para instalar as extensões.    |
| Banco de dados não inicia (porta ocupada) | Altere a porta nas variáveis (ex.: `PGPORT`) ou pare o serviço que está usando-a.|
| Python não é reconhecido                  | A instalação do Python é feita apenas para o usuário; reinicie o `start.bat`.    |

---

## 8. Encerramento

Para sair do DEVAPP, escolha a opção `( 0 ) SAIR` no menu principal ou feche a janela do Prompt de Comando. Lembre-se de que os servidores de banco de dados abertos continuarão rodando até que você feche suas respectivas janelas – sempre encerre-os corretamente para evitar corrupção de dados.

---

**DEVAPP – Desenvolvido por Prof. Rômulo (rfdouro@gmail.com)**  
Versão: baseada em `start.bat` – consulte o cabeçalho do script para detalhes de compilação e autor.

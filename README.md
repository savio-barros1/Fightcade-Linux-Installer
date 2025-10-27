# 🎮 Fightcade-Linux-Installer
Scripts de automação para facilitar a instalação e execução do emulador Fightcade no Linux.

Este projeto oferece dois scripts Bash simples para automatizar o processo de download, extração e **inicialização do emulador** do Fightcade (que utiliza o executável `ggpofba-ng.exe`) em sistemas operacionais Linux, utilizando o Wine.

## 📝 Scripts Incluídos

| Script | Descrição |
| :--- | :--- |
| `install_fightcade.sh` | Baixa a versão mais recente do Fightcade para Linux e a extrai no diretório atual, criando a pasta `Fightcade`. |
| `start_fightcade.sh` | Verifica a instalação do Wine, localiza o executável `ggpofba-ng.exe` (dentro da pasta `Fightcade`) e o **inicia através do Wine.** |

## 🚀 Como Usar

### 1. Pré-requisitos: Instalação do Wine

Para que o script de inicialização (`start_fightcade.sh`) funcione, você precisa ter o **Wine** instalado em seu sistema Linux.

> ℹ️ **Instalação do Wine:**
> Visite a página de downloads do WineHQ para instruções detalhadas e específicas para o seu sistema:
> **[https://www.winehq.org/download](https://www.winehq.org/download)**

Além do Wine, certifique-se de que os comandos **`wget`** e **`tar`** estão disponíveis.

### 2. Baixar e Configurar os Scripts

1.  Clone este repositório ou baixe os scripts:

    ```bash
    git clone https://github.com/savio-barros1/Fightcade-Linux-Installer.git
    cd Fightcade-Linux-Installer
    ```

2.  Dê permissão de execução aos scripts:

    ```bash
    chmod +x install_fightcade.sh start_fightcade.sh
    ```

---

### 3. Execução Completa: Instalar e Iniciar o Emulador

Use a sequência de comandos abaixo para ter o Fightcade instalado e rodando rapidamente.

#### Fluxo Completo:

```bash
1. Instala o Fightcade:
./install_fightcade.sh

2. Inicia o emulador (ggpofba-ng.exe) usando o Wine:
./start_fightcade.sh
```


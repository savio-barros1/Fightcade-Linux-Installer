#!/usr/bin/env bash
#
# Autor: Sávio Barros
# Data de Criação: 23/10/2025
# Versão: 1.0
#

echo "Iniciando a busca pelo emulador ggpofba-ng.exe e execução via Wine..."

# --- 1. VERIFICAÇÃO DO WINE ---

# Checa se o comando 'wine' está disponível no sistema.
if ! command -v wine &> /dev/null; then
  echo "ERRO: O programa 'wine' não foi encontrado."
  echo "O Wine é necessário para rodar o 'ggpofba-ng.exe'."
  echo "Por favor, instale o Wine e tente novamente."
  exit 1
fi

# --- 2. LOCALIZAÇÃO DO EXECUTÁVEL (usando find) ---

# Usa 'find' para buscar o arquivo 'ggpofba-ng.exe' em todo o diretório HOME (~);
# -type f: busca por arquivo (file);
# -name: busca pelo nome exato do arquivo;
# -print -quit: exibe o caminho completo do primeiro arquivo encontrado e para a busca.
EXECUTABLE_PATH=$(find ~ -type f -name "ggpofba-ng.exe" -print -quit 2>/dev/null)

# Checa se o 'find' encontrou o executável.
if [ -z "$EXECUTABLE_PATH" ]; then
  echo "ERRO: Não foi possível encontrar o arquivo 'ggpofba-ng.exe' em nenhum lugar no diretório '$HOME'."
  echo "Certifique-se de que o Fightcade foi baixado e extraído corretamente."
  exit 1
fi

echo "Executável encontrado em: $EXECUTABLE_PATH"

# --- 3. EXTRAÇÃO DO CAMINHO E EXECUÇÃO ---

# Extrai o diretório onde o executável está localizado.
# O 'dirname' é usado, pois o Wine geralmente precisa ser executado do diretório do executável.
EXEC_DIR=$(dirname "$EXECUTABLE_PATH")
EXEC_FILE=$(basename "$EXECUTABLE_PATH")

echo "Entrando no diretório: $EXEC_DIR"

# Entra no diretório ou para se falhar.
cd "$EXEC_DIR" || exit 1

# Executa o emulador usando o Wine.
echo "Executando '$EXEC_FILE' com Wine..."
wine "$EXEC_FILE" 2>/dev/null

echo "O 'ggpofba-ng.exe' foi fechado."
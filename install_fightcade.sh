#!/usr/bin/env bash
#
# Autor: Sávio Barros
# Data de Criação: 23/10/2025
# Versão: 1.0
#

# Onde o Fightcade está hospedado.
DOWNLOAD_URL="https://web.fightcade.com/download/Fightcade-linux-latest.tar.gz"

# Nome que daremos ao arquivo baixado.
OUTPUT_FILE="fightcade.tar.gz"

# Pasta que será criada ao descompactar.
EXTRACTION_DIR="Fightcade"

# --- 1. VERIFICA E BAIXA ---

# Vê se o arquivo .tar.gz já existe.
if [ -f "$OUTPUT_FILE" ]; then
  echo "AVISO: Arquivo '$OUTPUT_FILE' já está aqui. Pulando o download."
else
  echo "Baixando Fightcade '$OUTPUT_FILE'..."

  # Baixa o arquivo usando wget.
  wget -O "$OUTPUT_FILE" "$DOWNLOAD_URL"

  # Checa se o download deu certo.
  if [ $? -eq 0 ]; then
    echo "Download OK! Arquivo salvo."
  else
    # Se falhar, avisa e para o script.
    echo "ERRO: O download falhou. Vê a sua internet ou o link."
    exit 1
  fi
fi

# --- 2. VERIFICA E EXTRAI ---

# Se o arquivo não existir (porque foi pulado ou deu erro), não tem como extrair.
if [ ! -f "$OUTPUT_FILE" ]; then
  echo "ERRO: O arquivo '$OUTPUT_FILE' sumiu. Impossível extrair."
  exit 1
fi

# Vê se a pasta de instalação já existe.
if [ -d "$EXTRACTION_DIR" ]; then
  echo "AVISO: A pasta '$EXTRACTION_DIR' já existe. Pulando a extração."
else
  echo "Começando a extração de '$OUTPUT_FILE'..."
  
  # Descompacta o arquivo.
  tar -xzf "$OUTPUT_FILE"

  # Checa se a extração deu certo.
  if [ $? -eq 0 ]; then
    echo "Extração OK! O Fightcade está na pasta '$EXTRACTION_DIR'."
  else
    # Se falhar, avisa e para o script.
    echo "ERRO: A extração falhou."
    exit 1
  fi
fi

echo "Tudo pronto!"
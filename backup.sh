#!/bin/bash
#################################
#				#
#				#
#				#
#	Script de Backup	#
#				#
#				#
#				#
#################################

# armazena diretorio de destino
diretorio_destino="/home/joao/Documentos/oficina/dir_backup"

#formata data e hora atual para nomear o arquivo de backup
date=$(date +%d-%m-%Y--%H-%M-%S)

# cria e armazena o arquivo de backup com o nome e o formato
arquivo_backup="backup_$date.tar.gz"

# armazena o diretorio de origem
diretorio_origem="/home/joao/Documentos/oficina"

# cria o arquivo de backup utilizando o comando `tar`
# com as opções `-czf`
# `-c` cria um novo arquivo
# `-z` comprime o arquivo usando gzip
# `-f` especifica o nome do arquivo
tar czf "$diretorio_destino/$arquivo_backup" "$diretorio_origem"

if [ $? -eq 0 ]; then
	echo  "backup feito em: $diretorio_destino/$arquivo_backup"
else
	echo "erro"
fi

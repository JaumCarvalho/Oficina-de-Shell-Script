#!/bin/bash
#							#
#							#
#							#
#							#
#	Script para atualizar pacotes disponíveis	#
#							#
#							#
#							#
#							#

# primeiro atualizamos a lista de pacotes disponíveis no sistema com o comando `sudo apt-get update`
# O `> /dev/null` redireciona a saída padrão(que seria listar todos os pacotes) para o
# dispositivo especial `/dev/null`, resumindo, ele não vai mostrar nada na tela da saída 
# desse comando sudo apt-get update, serve para outros comandos também

sudo apt-get update > /dev/null

# nesta etapa armazenamos o resultado de um comando na variável atualizacoes
# o `apt list` com a flag `--upgradable` verifica se tem atualizações disponíveis e lista
# todos os pacotes que tem uma versão mais recente disponível pra atualizar
# `2>/dev/null` redireciona a saída de erro padrão pra `/dev/null` e não vai mostrar as mensagens de erro
# `grep -c upgradable` vai contar o número de linhas que tem a palavra `atualiz`
# OBS:  tô usando atualizáveis pq tá em pt-BR, se tiver em inglês utiliza-se a palavra `upgradable`

atualizacoes=$(apt list --upgradable 2>/dev/null | grep -c atualizáveis)



# verifica se o numero de atualizações é maior que 0

if [ $atualizacoes -gt 0 ]; then




# se for maior que zero atualiza os pacotes usando o comando `sudo apt-get upgrade`
# a flag `-y` responde com YES automaticamente
# `> dev null redireciona a saída pra não mostrar nada na tela`

	sudo apt-get upgrade -y > /dev/null



# verifica se o comando anterior foi executado com sucesso
# a variável especial `$?` armazena o código de saída do último comando executado
# o código 0 indica que o comando foi executado sem erro

	if [ $? -eq 0 ]; then
		echo "Atualizações instaladas com sucesso."
	else
		echo "Erro ao instalar"
	fi
else
	echo "Não tem atualizações disponíveis"
fi

#!/bin/bash
#################################################################
#								#
#								#
#								#
#	Script para verificar se um serviço tá em execução	#
#								#
#								#
#								#
#################################################################

# armazena o serviço a ser verificado na variável servico

servico="nome_do_servico"

# o comando `systemctl` mostra todos os serviços em execução e os que não estão
# o parametro `is-active` verifica se um serviço tá ativo 
# o parametro `--quiet` faz com que o comando seja executado sem imprimir nada na tela

if systemctl is-active --quiet "$servico"; then
	echo "ta em execucao"
else
	echo "nao ta rodando, vamos reiniciar..."

# `systemctl restart` reinicia o serviço
	systemctl restart "$servico"

# verifica se o código de saída do comando acima foi executado com sucesso, retornou 0
	if [ $? -eq 0 ]; then
		echo "reiniciado"
	else
		echo "erro ao reiniciar"
	fi
fi

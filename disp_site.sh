#!/bin/bash
#########################################################
#							#
#							#
#							#
#     script para veriicar disponibilidade de um site   #
#							#
#							#
#							#
#########################################################



#url a ser verificada
url="https://sigaa.ufopa.edu.br"

# o comando curl faz uma solicitação HTTP do tipo GET pro site acima

# a flag -s silencia a  saída do comando curl

# o parametro -o /dev/null descarta o corpo da resposta feita pelo comando curl

# se quiser testa esse comando no terminal pra ver como o comando curl funciona >>  curl https://site.com

# o parametro -w %{http_code} exibe apenas o código de status da resposta feita pelo comando curl

resposta=$(curl -s -o /dev/null -w "%{http_code}" $url)

#verifica se a reposta é igual a 200, pois 200 é status de sucesso/ok em requisições http
if [ $resposta -eq 200 ]; then
	echo "tá ok"
else
	echo "não tá ok, res: $resposta"
fi

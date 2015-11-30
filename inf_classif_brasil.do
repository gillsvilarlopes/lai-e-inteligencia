// ATEN‚ÌO: Este script Ž para ser aberto no software estat’stico STATA

// Abrindo o banco de dados (DB) inf_classif_brasil.dta
use inf_classif_brasil.dta

// Como h‡ muitas observa›es (168), sugere-se que o comando MORE seja desativado
set more off

// Vis‹o geral do DB (para uma descri‹o mais detalhada, use o comando CODEBOOK)
describe

/* Resumo da vari‡vel ic_total, apresentando apenas os —rg‹os pœblicos que 
possuem, pelo menos, uma informa‹o classificada em algum n’vel de sigilo legal */
sum ic_total if ic_total ~=0

// Ordena crescentemente as observa›es da vari‡vel ic_total
sort ic_total

// Listagem apenas dos —rg‹os que possuem informa‹oes ultrassecretas
list orgao ic_ultrassec if ic_ultrassec ~=0

// Listagem dos —rg‹os que possuem informa›es classificadas, por ordem decrescente
list orgao ic_total if ic_total ~=0

/* O GRçFICO 1 (îrg‹os federais com informa›es ultrassecretas) pode ser gerado,
de forma bem b‡sica, com o comando abaixo. Caso o leitor/ */
graph bar (rawsum) ic_ultrassec, over(orgao) cw blabel(bar), if ic_ultrassec >0

/* Caso o leitor/pesquisador queira abrir o mesmo Gr‡fico 1 do artigo, basta 
dar dois cliques sobre o arquivo 'grafico-1.gph' ou digitar o comando abaixo */
graph use grafico-1.gph

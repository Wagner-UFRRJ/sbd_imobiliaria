<?php
	require_once("../../config/config.php");
	require_once("../../comum/funcoes.php");
	$conexao=conectar($dados_conexao);
	$consulta = "
				SELECT i.id, r.valor_m2
				FROM regiao r, imovel i
				WHERE ST_CONTAINS(r.geometria, i.local)
			";
	$resultado_consulta = mysqli_query($conexao, $consulta);
	if (!$resultado_consulta) {
		sair("Consulta inválida: ".mysqli_error($conexao), $conexao);
	}
	echo "<table class='tabela_resultado'>";
	echo "<tr><th>ID Imóvel</th><th>Valor M2</th></tr>";
	while ($linha = mysqli_fetch_assoc($resultado_consulta)){
		echo "<tr>";
		echo "<td>".$linha["id"]."</td><td>".$linha["valor_m2"]."</td>";
		echo "</tr>";
	}
	echo "</table>";
?>